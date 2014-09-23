//
//  CardGameViewController.swift
//  Matchismo1
//
//  Created by Steve Liddle on 9/10/14.
//  Copyright (c) 2014 IS 543. All rights reserved.
//

import UIKit

class CardGameViewController : UIViewController {
    lazy var cards: [UIButton: Card]! = [UIButton: Card]()
    var game: CardMatchingGame!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var flipLabel: UILabel!

    var flipCount: Int = 0 {
        didSet {
            flipLabel.text = "Flips: \(flipCount)"
        }
    }

    @IBOutlet var cardButtons: [UIButton]! {
        didSet {
            game = CardMatchingGame(cardCount: cardButtons.count, deck: PlayingCardDeck())
        }
    }

    @IBAction func flipCard(sender: UIButton) {
        game.flipCardAtIndex(indexOfButton(sender))
        ++flipCount
        updateUI()
    }
    
    func updateUI() {
        let cardBack = UIImage(named: "CardBack")
        let cardFront = UIImage(named: "CardFront")
        
        for button in cardButtons {
            let card = game.cardAtIndex(indexOfButton(button))!
            if card.faceUp {
                button.setTitle(card.contents, forState: .Normal)
                button.setBackgroundImage(cardFront, forState: .Normal)
                button.enabled = !card.unplayable
            } else {
                button.setTitle("", forState: .Normal)
                button.setBackgroundImage(cardBack, forState: .Normal)
            }
        }
        scoreLabel.text = "Score: \(game.currentScore())"
    }
    
    func indexOfButton(button: UIButton) -> Int {
        for i in 0 ..< cardButtons.count {
            if button == cardButtons[i] {
                return i
            }
        }
        return -1
    }
    
}