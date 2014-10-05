//
//  SetGameViewController.swift
//  Matchismo1
//
//  Created by Anthony Frehner on 10/4/14.
//  Copyright (c) 2014 IS 543. All rights reserved.
//

import UIKit

class SetGameViewController : CardGameViewController {
    
    // MARK: Properties
    var setCardBack = UIImage(named: "CardFront")
    override var cardBack: UIImage {
        get {
            return setCardBack
        }
    }
    
    // MARK: Outlets
    @IBOutlet override var cardButtons: [UIButton]! {
        didSet {
            game = CardMatchingGame(cardCount: cardButtons.count, deck: SetCardDeck(), numberOfCardsMatching: 1)
        }
    }
    
    // MARK: Actions
    
    // MARK: Helpers
    override func getGameType() -> String {
        return "Set"
    }
    
    // MARK: View controller lifecycle
    override func viewDidAppear(animated: Bool) {
        updateUI()
    }
}