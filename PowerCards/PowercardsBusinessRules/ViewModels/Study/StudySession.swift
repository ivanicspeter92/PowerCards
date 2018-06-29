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
                
                if isInLastState {
                    delegate?.lastStateWasReached()
                }
            }
        }
    }
    var delegate: StudySessionDelegate?
    private(set) var results: [(result: StudyModeResult?, card: Powercard, shape: Shape)] = []
    
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
    
    public var isInLastState: Bool {
        return currentState == statesCount
    }
    
    public mutating func nextState() {
        currentState = currentState + 1
    }
    
    public mutating func finishSession() -> StudySessionSummary {
        return StudySessionSummary()
    }
    
    public func selected(shape: Shape) {
        delegate?.shouldReveal(shape: shape)
        
        if mode.shouldShowResultPickerAfterSelectingShape {
            delegate?.shouldShowResultPicker(for: shape)
        }
    }
    
    public mutating func setResult(to result: StudyModeResult?, shape: Shape) {
        results.append((result: result, card: currentCard, shape: shape))
    }
    
    public func hasResult(for shape: Shape) -> Bool {
        return self.results.contains(where: { previousResult in
            return previousResult.shape == shape
        })
    }
}

protocol StudySessionDelegate {
    func stateHasChanged()
    func lastStateWasReached()
    func sessionFinished()
    func shouldReveal(shape: Shape)
    func shouldShowResultPicker(for shape: Shape)
}
