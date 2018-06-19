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
    
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var nextButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSessionToView()
    }
    
    // MARK: Event handlers
    @IBAction func exitButtonTapped(_ sender: UIBarButtonItem) {
        presentAreYouSureToExitAlert()
    }
    
    @IBAction func nextButtonTapped(_ sender: UIBarButtonItem) {
        session.nextState()
    }
    
    // MARK: Private
    private func loadSessionToView() {
        navigationItem.title = session.title
        loadCurrentCardToView()
        loadCardShapesToView()
    }
    
    private func loadCurrentCardToView() {
        self.cardImageView.image = self.session.currentCard.image
    }
    
    private func loadCardShapesToView() {
        (self.session.currentCard as? PowerFlashCard)?.shapes.forEach({
            cardImageView.addSubview($0.view)
        })
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
}
