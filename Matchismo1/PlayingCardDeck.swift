//
//  PlayingCardDeck.swift
//  Matchismo1
//
//  Created by Anthony Frehner on 9/13/14.
//  Copyright (c) 2014 IS 543. All rights reserved.
//

import Foundation

class PlayingCardDeck: Deck {
    override init() {
        super.init()
        
        for suit in PlayingCard.validSuits() {
            for rank in 1...PlayingCard.maxRank() {
                var card = PlayingCard()
                card.rank = rank
                card.suit = suit
                
                addCard(card, atTop: true)
            }
        }
    }
}