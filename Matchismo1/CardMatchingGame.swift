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
    private var numCardsMatching:Int = 1
    
    let FLIP_COST = 1
    let MATCH_BONUS = 4
    let MISMATCH_PENALTY = 2
    
    init(cardCount: Int, deck: Deck, numberOfCardsMatching: Int) {
        for i in 0 ..< cardCount {
            if let card = deck.drawRandomCard() {
                cards.append(card)
            }
        }
        
        //make it  if something else is passed in, just for security
        if numberOfCardsMatching == 0 || numberOfCardsMatching == 1 {
            numCardsMatching = numberOfCardsMatching + 1
        } else {
            numCardsMatching = 1
        }
    }
    
    func flipCardAtIndex(index: Int) ->String? {
        var resultString:String? = ""
        var potentialCardMatches:[Card] = []
        
        if let card = cardAtIndex(index) {
            
            if !card.unplayable {
                
                if !card.faceUp {
                    
                    resultString = "Flipped \(card.contents)"
                    
                    for otherCard in cards {
                        
                        if otherCard.faceUp && !otherCard.unplayable {
                            //make sure we only put in as many cards as there should be for the game (eg 2 cards for 2 card matching game)
                            if numCardsMatching > potentialCardMatches.count {
                                potentialCardMatches.append(otherCard)
                            }
                        }
                    }
                    
                    //only get a score if the number of cards that are potential matches is the number of cards for your game type (2 matches or 3 matches)
                    if potentialCardMatches.count == numCardsMatching {
                        
                        let matchScore = card.match(potentialCardMatches)
                        // match tells how good a match it is, or 0 if mismatch
                        if matchScore > 0 {
                            resultString! += ", matched "
                            
                            for matchedCard in potentialCardMatches {
                                matchedCard.unplayable = true
                                resultString! += "\(matchedCard.contents) "
                            }
                            
                            card.unplayable = true
                            score += matchScore * MATCH_BONUS
                            //score += matchScore * MATCH_BONUS
                            resultString! += "for \(matchScore * MATCH_BONUS) points"
                        } else {
                            score -= MISMATCH_PENALTY
                            resultString! += ", mismatched "
                            
                            for mismatchedCard in potentialCardMatches {
                                resultString! += "\(mismatchedCard.contents) "
                            }
                            
                            resultString! += "for a \(MISMATCH_PENALTY) point penalty"
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
    
    func getNumCardsMatching() -> Int {
        return numCardsMatching
    }
}