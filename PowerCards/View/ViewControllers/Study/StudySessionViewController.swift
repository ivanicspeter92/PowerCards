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
    
    @IBAction func imageWasTapped(_ sender: UITapGestureRecognizer) {
        let point = sender.location(in: cardImageView)
        
        cardImageView.wasTapped(at: point)
    }
    
    func findShapeView(for shape: Shape) -> ShapeView? {
        return cardImageView.subviews.compactMap({ $0 as? ShapeView }).first(where: { $0.shape == shape })
    }
    
    // MARK: Private
    private func loadSessionToView() {
        navigationItem.title = session.title
        loadCurrentCardToView()
    }
    
    private func loadCurrentCardToView() {
        self.cardImageView.card = self.session.currentCard as? PowerFlashCard
    }
    
    private func presentAreYouSureToExitAlert() {
        let alert = UIAlertController(title: "Are You Sure?", message: "The current status and results will be lost.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Exit", style: .default, handler: { [weak self] alert in
            self?.dismiss(animated: true, completion: nil)
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
        nextButton.isEnabled = false
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
}

extension StudySessionViewController: FlashcardImageViewDelegate {
    func selected(shape: Shape) {
        shouldReveal(shape: shape)
    }
}
