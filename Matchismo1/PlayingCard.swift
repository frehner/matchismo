//
//  PlayingCard.swift
//  Matchismo1
//
//  Created by Anthony Frehner on 9/13/14.
//  Copyright (c) 2014 IS 543. All rights reserved.
//

import Foundation

class PlayingCard: Card {
    let RANK_MATCH_SCORE = 4
    let SUIT_MATCH_SCORE = 1
    
    override func match(otherCards: [Card]) -> Int {
        var score = 0
        if otherCards.count >= 1 {
            
            var totalMatches = 0
            var rankMatches = 0
            var suitMatches = 0
            
            for otherCard in otherCards {
                if let otherPlayingCard = otherCard as? PlayingCard {
                    if otherPlayingCard.suit == suit {
                        totalMatches++
                        suitMatches++
                    } else if otherPlayingCard.rank == rank {
                        totalMatches++
                        rankMatches++
                    }
                }
            }
            
            //this way, even if we add 15 (or other random #) card matching game, this code shouldn't have to change
            if totalMatches == otherCards.count {
                score = (suitMatches * SUIT_MATCH_SCORE + rankMatches * RANK_MATCH_SCORE) * totalMatches
            }
            
        }
        return score
    }
    
    var suit:String! {
        didSet {
            if !contains(self.dynamicType.validSuits(), suit) {
                suit = "?"
            }
            contents = NSAttributedString(string: "\(self.dynamicType.rankStrings()[rank])\(suit)")
        }
    }
    
    var rank:Int! {
        didSet {
            if rank < 0 || rank > self.dynamicType.maxRank() {
                rank = 0
            }
            contents = NSAttributedString(string: "\(self.dynamicType.rankStrings()[rank])\(suit)")
        }
    }
    
    private class func rankStrings() -> [String] {
        return ["?", "A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    }
    
    class func validSuits() -> [String] {
        return ["♥", "♦", "♠", "♣"]
    }
    
    class func maxRank() -> Int {
        return rankStrings().count - 1
    }
}