//
//  SessionSummaryViewController.swift
//  PowerCards
//
//  Created by Peter Ivanics on 29/06/2018.
//  Copyright © 2018 Powercards. All rights reserved.
//

import UIKit

class SessionSummaryViewController: UIViewController {
    var summary: StudySessionSummary!

    @IBOutlet weak var skippedCountLabel: UILabel!
    @IBOutlet weak var greenCountLabel: UILabel!
    @IBOutlet weak var yellowCountLabel: UILabel!
    @IBOutlet weak var redCountLabel: UILabel!
    
    @IBOutlet weak var finishSessionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        skippedCountLabel.text = summary.results(for: nil).count.description
        greenCountLabel.text = summary.results(for: .green).count.description
        yellowCountLabel.text = summary.results(for: .yellow).count.description
        redCountLabel.text = summary.results(for: .red).count.description
    }
    
    @IBAction func finishSessionTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
