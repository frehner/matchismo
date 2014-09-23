//
//  CardMatchingGame.swift
//  Matchismo1
//
//  Created by Anthony Frehner on 9/20/14.
//  Copyright (c) 2014 IS 543. All rights reserved.
//

import Foundation

class CardMatchingGame {
    private lazy var cards: [Card] = []
    private var score = 0
    private lazy var resultString:String = ""
    
    let FLIP_COST = 1
    let MATCH_BONUS = 4
    let MISMATCH_PENALTY = 2
    
    init(cardCount: Int, deck: Deck) {
        for i in 0 ..< cardCount {
            if let card = deck.drawRandomCard() {
                cards.append(card)
            }
        }
    }
    
    func flipCardAtIndex(index: Int) ->String? {
        if let card = cardAtIndex(index) {
            if !card.unplayable {
                if !card.faceUp {
                    resultString = "Flipped \(card.contents)"
                    for otherCard in cards {
                        if otherCard.faceUp && !otherCard.unplayable {
                            let matchScore = card.match([otherCard])
                            // match tells how good a match it is, or 0 if mismatch
                            if matchScore > 0 {
                                otherCard.unplayable = true
                                score += matchScore * MATCH_BONUS
//                                score += matchScore * MATCH_BONUS
                                resultString += ", matched \(otherCard.contents) for \(matchScore * MATCH_BONUS) points"
                            } else {
                                score -= MISMATCH_PENALTY
                                resultString += ", mismatched \(otherCard.contents). \(MISMATCH_PENALTY) point penalty"
                            }
                            // we've found the other face-up playable card, so stop looking
                            break
                        }
                    }
                    // always charge a cost to flip
                    score -= FLIP_COST
                }
                card.faceUp = !card.faceUp
            } 
        }
        return resultString
    }
    
    func cardAtIndex(index: Int) -> Card? {
        if index >= 0 && index < cards.count {
            return cards[index]
        }
        return nil
    }
    
    func currentScore() -> Int {
        return score
    }
}