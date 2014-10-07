//
//  SetCardDeck.swift
//  Matchismo1
//
//  Created by Anthony Frehner on 10/4/14.
//  Copyright (c) 2014 IS 543. All rights reserved.
//

import Foundation

class SetCardDeck:Deck {
    override init() {
        super.init()
        
        for symbol in SetCard().validSymbols() {
            for number in SetCard().validNumbers() {
                for shade in SetCard().validShading() {
                    for color in SetCard().validColors() {
                        var card = SetCard()
                        card.color = color
                        card.shade = shade
                        card.number = number
                        card.symbol = symbol
                        addCard(card, atTop: true)
                    }
                }
            }
        }
    }
}