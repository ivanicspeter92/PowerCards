//
//  QuizViewController.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

import UIKit
import BEMCheckBox
import PowerCardsBusinessRules

class QuizViewController: UIViewController {
    @IBOutlet weak var container: UIStackView!
    
    var deckDetails: Powerdeck!
    
    private(set) var correctAnswers = 0
    private var currentQuestionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.loadNextQuestion()
    }
    
    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Are you sure to quit the quiz?", message: "All your results will be lost!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { (alert) in
            self.dismiss(animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: Private
    private func updateTitle() {
        title = deckDetails.name + " (\(currentQuestionIndex + 1)/\(deckDetails.cards))"
    }
    
    private func loadNextQuestion() {
//        updateTitle()
//        container.arrangedSubviews.forEach({ $0.removeFromSuperview() })
//        
//        let card = self.deckDetails.cards[currentQuestionIndex]
//        
//        let questionLabel = UILabel()
//        questionLabel.text = card.question
//        questionLabel.font = UIFont.boldSystemFont(ofSize: questionLabel.font.pointSize)
//        questionLabel.numberOfLines = 0
//        questionLabel.textAlignment = .center
//        
//        container.addArrangedSubview(questionLabel)
//        
//        card.answers.forEach({
//            let horizontalStack = UIStackView()
//            horizontalStack.axis = .horizontal
//            horizontalStack.alignment = .center
//            horizontalStack.distribution = .fill
//            horizontalStack.spacing = 10
//            
//            let answerLabel = UILabel()
//            answerLabel.text = $0.text
//            answerLabel.numberOfLines = 0
//            
//            let checkbox = BEMCheckBox()
//            checkbox.boxType = .square
//            
//            checkbox.addConstraint(NSLayoutConstraint(item: checkbox, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 25))
//            checkbox.addConstraint(NSLayoutConstraint(item: checkbox, attribute: .height, relatedBy: .equal, toItem: checkbox, attribute: .width, multiplier: 1, constant: 0))
//
//            
//            horizontalStack.addArrangedSubview(checkbox)
//            horizontalStack.addArrangedSubview(answerLabel)
//            
////            horizontalStack.addConstraint(NSLayoutConstraint(item: horizontalStack, attribute: .width, relatedBy: .equal, toItem: container, attribute: .width, multiplier: 1, constant: 0))
//            
//            container.addArrangedSubview(horizontalStack)
//        })
//        
//        currentQuestionIndex += 1
    }
}
