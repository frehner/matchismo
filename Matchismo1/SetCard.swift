//
//  SetCard.swift
//  Matchismo1
//
//  Created by Anthony Frehner on 10/4/14.
//  Copyright (c) 2014 IS 543. All rights reserved.
//

import Foundation

class SetCard: Card {
    // MARK: Constants
    let MATCH_SCORE = 5
    
    // MARK: Properties
    var number:Int! {
        didSet {
            if !contains(validNumbers(), number) {
                number = 0
            }
        }
    }
    var symbol:String! {
        didSet {
            if !contains(validSymbols(), symbol) {
                symbol = "?"
            }
        }
    }
    var shade:String! {
        didSet {
            if !contains(validShading(), shade) {
                shade = "!"
            }
        }
    }
    var color:String! {
        didSet {
            if !contains(validColors(), color) {
                color = "@"
            }
        }
    }
    
    // MARK: Methods
    override func match(otherCards: [Card]) -> Int {
        var score = 0
        
        if otherCards.count == 2 {
            let otherCard1 = otherCards[0]
            let otherSetCard1 = otherCard1 as SetCard
            
            let otherCard2 = otherCards[1]
            let otherSetCard2 = otherCard2 as SetCard
            
            let isAColorSet = self.dynamicType.isASet(firstCardAttribute: self.color, secondCardAttribute: otherSetCard1.color, thirdCardAttribute: otherSetCard2.color)
            
            let isAShadeSet = self.dynamicType.isASet(firstCardAttribute: self.shade, secondCardAttribute: otherSetCard1.shade, thirdCardAttribute: otherSetCard2.shade)
            
            let isASymbolSet = self.dynamicType.isASet(firstCardAttribute: self.symbol, secondCardAttribute: otherSetCard1.symbol, thirdCardAttribute: otherSetCard2.symbol)
            
            let isANumberSet = self.dynamicType.isASet(firstCardAttribute: self.number, secondCardAttribute: otherSetCard1.number, thirdCardAttribute: otherSetCard2.number)
            
            if (isAColorSet && isAShadeSet && isASymbolSet && isANumberSet) {
                score = MATCH_SCORE
            }
            
        }
        
        return score
    }
    
    func validNumbers() -> [Int] {
        return [1,2,3]
    }
    
    func validSymbols() -> [String] {
        return ["▲", "●", "■"]
    }
    
    func validShading() -> [String] {
        return ["striped", "solid", "open"]
    }
    
    func validColors() -> [String] {
        return ["green", "red", "blue"]
    }
    
    // MARK: Helpers
    private class func isASet<T: Equatable>(firstCardAttribute one: T, secondCardAttribute two: T, thirdCardAttribute three: T) -> Bool {
        if ( (one == two) && (one == three) ) || ( (one != two) && (one != three) && (two != three) ) {
            return true
        } else {
            return false
        }
    }
    
}