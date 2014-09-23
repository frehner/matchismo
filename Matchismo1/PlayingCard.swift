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
        if otherCards.count == 1 {
            if let otherCard = otherCards.last as? PlayingCard {
                if otherCard.suit == suit {
                    score = SUIT_MATCH_SCORE
                } else if otherCard.rank == rank {
                    score = RANK_MATCH_SCORE
                }
            }
        }
        return score
    }
    
    var suit:String! {
        didSet {
            if !contains(PlayingCard.validSuits(), suit) {
                suit = "?"
            }
            contents = "\(PlayingCard.rankStrings()[rank])\(suit)"
        }
    }
    
    var rank:Int! {
        didSet {
            if rank < 0 || rank > PlayingCard.maxRank() {
                rank = 0
            }
            contents = "\(PlayingCard.rankStrings()[rank])\(suit)"
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