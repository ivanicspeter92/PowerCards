//
//  NotificationKeys.swift
//  PowerCards
//
//  Created by Peter Ivanics on 26/08/2017.
//  Copyright © 2017 Powercards. All rights reserved.
//

public enum NotificationKeys: String {
    case deckNameChanged = "DeckNameChangedNotification"
    case deckDeleted = "DeckDeletedNotification"
    case newCardWasAddedToDeck = "NewCardWasAddedToDeckNotification"
    case cardWasRemovedFromDeck = "cardWasRemovedFromDeckNotification"
    case cardNameChanged = "cardNameChangedNotification"
    case cardSubtitleChanged = "cardSubtitleChangedNotification"
    case cardImageChanged = "cardImageChangedNotification"
    case shapeWasAddedToFlashCard = "shapeWasAddedToFlashCardNotification"
    case shapeWasRemovedFromFlashCard = "shapeWasRemovedFromFlashCardNotification"
}
