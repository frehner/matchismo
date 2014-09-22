//
//  CardGameViewController.swift
//  Matchismo1
//
//  Created by Steve Liddle on 9/10/14.
//  Copyright (c) 2014 IS 543. All rights reserved.
//

import UIKit

class CardGameViewController : UIViewController {
    lazy var deck: Deck! = PlayingCardDeck()
    lazy var cards: [UIButton: Card]! = [UIButton: Card]()
    
    @IBOutlet weak var flipLabel: UILabel!

    var flipCount: Int = 0 {
        didSet {
            flipLabel.text = "Flips: \(flipCount)"
        }
    }

    @IBOutlet var cardButtons: [UIButton]! {
        didSet {
            for button in cardButtons {
                cards[button] = deck.drawRandomCard()
            }
        }
    }

    @IBAction func flipCard(sender: UIButton) {
        if let card = cards[sender] {
            card.faceUp = !card.faceUp
            
            if card.faceUp {
                ++flipCount
            }
        }
        
        updateUI()
    }
    
    func updateUI() {
        let cardBack = UIImage(named: "CardBack")
        let cardFront = UIImage(named: "CardFront")
        
        for (button, card) in cards {
            if card.faceUp {
                button.setTitle(card.contents, forState: .Normal)
                button.setBackgroundImage(cardFront, forState: .Normal)
            } else {
                button.setTitle("", forState: .Normal)
                button.setBackgroundImage(cardBack, forState: .Normal)
            }
        }
    }
}