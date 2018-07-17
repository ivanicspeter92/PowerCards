//
//  StudySession.swift
//  PowerCards
//
//  Created by Peter Ivanics on 16/06/2018.
//  Copyright © 2018 Powercards. All rights reserved.
//

public typealias ResultOnCardShape = (result: StudyModeResult?, card: Powercard, shape: Shape)

struct StudySession {
    let mode: StudyMode
    let deck: Powerdeck
    private(set) var currentState: Int {
        didSet {
            if oldValue != currentState {
                delegate?.stateHasChanged()
                notifyDelegetaIfInLastState()
            }
        }
    }
    var delegate: StudySessionDelegate?
    private(set) var results: [ResultOnCardShape] = []
    
    public init(mode: StudyMode, deck: Powerdeck, delegate: StudySessionDelegate?) {
        self.mode = mode
        self.deck = deck
        self.currentState = 1
        self.delegate = delegate
        
        notifyDelegetaIfInLastState()
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
        return StudySessionSummary(results: self.results)
    }
    
    public func selected(shape: Shape) {
        delegate?.shouldReveal(shape: shape)
        
        if mode.shouldShowResultPickerAfterSelectingShape {
            delegate?.shouldShowResultPicker(for: shape)
        }
    }
    
    public mutating func setResult(to result: StudyModeResult, shape: Shape) {
        results.append((result: result, card: currentCard, shape: shape))
        delegate?.resultWasSet(for: shape, to: result)
    }
    
    public func hasResult(for shape: Shape) -> Bool {
        return self.results.contains(where: { previousResult in
            return previousResult.shape == shape
        })
    }
    
    // MARK; Private
    private func notifyDelegetaIfInLastState() {
        if isInLastState {
            delegate?.lastStateWasReached()
        }
    }
}

protocol StudySessionDelegate {
    func stateHasChanged()
    func lastStateWasReached()
    func sessionFinished()
    func shouldReveal(shape: Shape)
    func shouldShowResultPicker(for shape: Shape)
    func resultWasSet(for shape: Shape, to result: StudyModeResult)
}

extension StudySessionDelegate {
    func resultWasSet(for shape: Shape, to result: StudyModeResult) {
    }
}
