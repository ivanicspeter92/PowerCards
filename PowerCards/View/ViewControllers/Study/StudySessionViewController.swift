//
//  StudySessionViewController.swift
//  PowerCards
//
//  Created by Peter Ivanics on 16/06/2018.
//  Copyright © 2018 Powercards. All rights reserved.
//

import UIKit

class StudySessionViewController: UIViewController {
    var session: StudySession!
    
    @IBOutlet weak var cardImageView: FlashcardImageView!
    @IBOutlet weak var nextButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardImageView.delegate = self
        loadSessionToView()
    }
    
    // MARK: Event handlers
    @IBAction func exitButtonTapped(_ sender: UIBarButtonItem) {
        presentAreYouSureToExitAlert()
    }
    
    @IBAction func nextButtonTapped(_ sender: UIBarButtonItem) {
        session.nextState()
    }
    
    @IBAction func completeButtonTapped(_ sender: UIBarButtonItem) {
        finishSession()
    }
    
    @IBAction func imageWasTapped(_ sender: UITapGestureRecognizer) {
        let point = sender.location(in: cardImageView)
        
        cardImageView.wasTapped(at: point)
    }
    
    func findShapeView(for shape: Shape) -> ShapeView? {
        return cardImageView.subviews.compactMap({ $0 as? ShapeView }).first(where: { $0.shape == shape })
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let sessionSummaryVC = segue.destination as? SessionSummaryViewController ?? (segue.destination as? UINavigationController)?.topViewController as? SessionSummaryViewController, let summary = sender as? StudySessionSummary {
            sessionSummaryVC.summary = summary
        }
    }
    
    // MARK: Private
    private func loadSessionToView() {
        navigationItem.title = session.title
        loadCurrentCardToView()
    }
    
    private func loadCurrentCardToView() {
        cardImageView.card = session.currentCard as? PowerFlashCard
    }
    
    private func finishSession() {
        let summary = session.finishSession()
        
        performSegue(withIdentifier: "toSessionSummary", sender: summary)
    }
    
    private func presentAreYouSureToExitAlert() {
        let alert = UIAlertController(title: "Are You Sure?", message: "The current status and results will be lost.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Exit", style: .default, handler: { [weak self] alert in
            self?.finishSession()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
}

extension StudySessionViewController: StudySessionDelegate {
    func stateHasChanged() {
        loadSessionToView()
    }
    
    func lastStateWasReached() {
        nextButton.title = "Complete"
        nextButton.action = #selector(completeButtonTapped(_:))
    }
    
    func sessionFinished() {
        dismiss(animated: true, completion: nil)
    }
    
    func shouldReveal(shape: Shape) {
        if let view = findShapeView(for: shape) {
            UIView.animate(withDuration: 0.5, animations: {
                view.backgroundColor = UIColor.clear
            })
        }
    }
    
    func shouldShowResultPicker(for shape: Shape) {
        if !session.hasResult(for: shape), let view = findShapeView(for: shape) {
            let alert = UIAlertController(title: "Result", message: nil, preferredStyle: .actionSheet)
            alert.popoverPresentationController?.sourceView = view
            alert.popoverPresentationController?.sourceRect = view.bounds
            alert.popoverPresentationController?.permittedArrowDirections = [.down, .up]
            
            StudyModeResult.all.forEach({ result in
                alert.addAction(UIAlertAction(title: result.title, style: .default, image: result.image?.withRenderingMode(.alwaysOriginal), handler: { alert in
                    self.session.setResult(to: result, shape: shape)
                }))
            })
            if UIDevice.current.userInterfaceIdiom == .pad {
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { [weak self] alert in
                    //                self.session.setResult(to: nil, shape: shape)
                    self?.shouldShowResultPicker(for: shape)
                })
                
                alert.addAction(cancelAction)
            }
            present(alert, animated: true)
        }
    }
    
    func resultWasSet(for shape: Shape, to result: StudyModeResult) {
        guard let shapeView = findShapeView(for: shape) else { return }
        
        let imageView = UIImageView(image: result.image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.addConstraint(NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: shape.borderWidth * 10))
        imageView.addConstraint(NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: shape.borderWidth * 10))
        
        view.addSubview(imageView)
        
        view.addConstraint(NSLayoutConstraint(item: shapeView, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: imageView, attribute: NSLayoutAttribute.centerX, multiplier: 1.0, constant: -1 * shape.borderWidth / 2))
        view.addConstraint(NSLayoutConstraint(item: shapeView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: imageView, attribute: NSLayoutAttribute.centerY, multiplier: 1.0, constant: -1 * shape.borderWidth / 2))
    }
}

extension StudySessionViewController: FlashcardImageViewDelegate {
    func selected(shape: Shape) {
        self.session.selected(shape: shape)
    }
}
