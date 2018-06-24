//
//  StudySession.swift
//  PowerCards
//
//  Created by Peter Ivanics on 16/06/2018.
//  Copyright © 2018 Powercards. All rights reserved.
//

struct StudySession {
    let mode: StudyMode
    let deck: Powerdeck
    private(set) var currentState: Int {
        didSet {
            if oldValue != currentState {
                delegate?.stateHasChanged()
                
                if currentState == statesCount {
                    delegate?.lastStateWasReached()
                }
            }
        }
    }
    var delegate: StudySessionDelegate?
    
    public init(mode: StudyMode, deck: Powerdeck, delegate: StudySessionDelegate?) {
        self.mode = mode
        self.deck = deck
        self.currentState = 1
        self.delegate = delegate
    }
    
    public var statesCount: Int {
        return deck.cards.count
    }
    
    public var title: String {
        return "\(self.deck.name) (\(self.currentState)/\(self.statesCount))"
    }
    
    public var currentCard: Powercard {
        return self.deck.card(at: currentState - 1)!
    }
    
    public mutating func nextState() {
        currentState = currentState + 1
    }
    
    public func selected(shape: Shape) {
        
    }
}

protocol StudySessionDelegate {
    func stateHasChanged()
    func lastStateWasReached()
    func sessionFinished()
    func shouldReveal(shape: Shape)
}
