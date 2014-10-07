//
//  Card.swift
//  Matchismo1
//
//  Created by Anthony Frehner on 9/13/14.
//  Copyright (c) 2014 IS 543. All rights reserved.
//

import Foundation

class Card {
    var contents = NSAttributedString()
    var faceUp = false
    var unplayable = false
    
    func match(otherCards: [Card]) -> Int {
        var score = 0
        
        for card in otherCards {
            if card.contents == contents {
                score = 1
                break
            }
        }
        
        return score
    }
}