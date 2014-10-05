//
//  SetGameViewController.swift
//  Matchismo1
//
//  Created by Anthony Frehner on 10/4/14.
//  Copyright (c) 2014 IS 543. All rights reserved.
//

import UIKit

class SetGameViewController : CardGameViewController {
    
    // MARK: Outlets
    @IBOutlet override var cardButtons: [UIButton]! {
        didSet {
            game = CardMatchingGame(cardCount: cardButtons.count, deck: PlayingCardDeck(), numberOfCardsMatching: 1)
        }
    }
    
    // MARK: Helpers
    override func startNewGame(numCardMatch: Int) {
        //reset ALL THE THINGS
        game = CardMatchingGame(cardCount: cardButtons.count, deck: PlayingCardDeck(), numberOfCardsMatching: 1)
        flipCount = 0
        resultLabel.text = "Results"
        resultLabel.alpha = 1
        resultHistory = []
        historySlider.maximumValue = 1
        historySlider.value = 0.5
        playableFaceUpCardIndicies = []
        
        //make sure that buttons that were disabled last game are now enabled
        for button in cardButtons {
            button.enabled = true
        }
        numCardsSegmentControl.enabled = true
        updateUI()
    }

}