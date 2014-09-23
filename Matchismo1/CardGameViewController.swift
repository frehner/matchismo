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
    lazy var resultHistory: [String]! = []
    var game: CardMatchingGame!
    
    private lazy var resultString:String = ""
    
    let cardBack = UIImage(named: "CardBack")
    let cardFront = UIImage(named: "CardFront")
    
    @IBAction func dealNewButton(sender: UIButton) {
        startNewGame()
    }

    @IBOutlet weak var numCardsSegmentControl: UISegmentedControl!
    @IBOutlet weak var resultLabel: UILabel!
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
        resultLabel.numberOfLines = 0
        if let resultText = game.flipCardAtIndex(indexOfButton(sender)) {
            resultLabel.text = resultText
            resultHistory.append(resultText)
        }
        ++flipCount
        updateUI()
    }
    
    func startNewGame() {
        game = CardMatchingGame(cardCount: cardButtons.count, deck: PlayingCardDeck())
        flipCount = 0
        
        for button in cardButtons {
            button.enabled = true
        }
        updateUI()
    }
    
    func updateUI() {
        
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