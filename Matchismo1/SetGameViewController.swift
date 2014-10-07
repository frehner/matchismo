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
    
    override func getSetCardAttributedString(cardToGetAttributedString setCard :SetCard) -> NSAttributedString {
        var textColor = UIColor.blackColor()
        var strokeColor = UIColor.blackColor()
        
        switch setCard.color {
        case "green":
            textColor = UIColor.greenColor()
            strokeColor = UIColor.greenColor()
        case "blue":
            textColor = UIColor.blueColor()
            strokeColor = UIColor.blueColor()
        default:
            textColor = UIColor.redColor()
            strokeColor = UIColor.redColor()
        }
        
        switch setCard.shade {
        case "striped":
            textColor = textColor.colorWithAlphaComponent(0.3)
        case "open":
            textColor = UIColor.whiteColor()
        default:
            textColor = textColor.colorWithAlphaComponent(1)
        }
        
        var styling = [NSForegroundColorAttributeName : textColor,
            NSStrokeWidthAttributeName : -3,
            NSStrokeColorAttributeName : strokeColor]
        var temporaryContent = NSAttributedString(string: setCard.symbol, attributes: styling)
        
        var finalContent = NSMutableAttributedString()
        
        for i in 1...setCard.number {
            finalContent.appendAttributedString(temporaryContent)
        }
        return finalContent
    }
    
    // MARK: View controller lifecycle
    override func viewDidAppear(animated: Bool) {
        updateUI()
    }
}