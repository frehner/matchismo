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
    
    private var playableFaceUpCards:[Card] = []
    
    @IBAction func dealNewButton(sender: UIButton) {
        startNewGame(numCardsSegmentControl.selectedSegmentIndex)
    }

    @IBAction func numCardsSegmentControlChange(sender: UISegmentedControl) {
        startNewGame(sender.selectedSegmentIndex)
    }
    
    @IBOutlet weak var numCardsSegmentControl: UISegmentedControl!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var flipLabel: UILabel!
    @IBOutlet weak var historySlider: UISlider!

    @IBAction func historySliderChanged(sender: UISlider) {
        if Int(sender.value) < resultHistory.count {
            resultLabel.text = resultHistory[Int(sender.value)]
        }
    }
    
    var flipCount: Int = 0 {
        didSet {
            flipLabel.text = "Flips: \(flipCount)"
        }
    }

    @IBOutlet var cardButtons: [UIButton]! {
        didSet {
            game = CardMatchingGame(cardCount: cardButtons.count, deck: PlayingCardDeck(), numberOfCardsMatching: 0)
        }
    }

    @IBAction func flipCard(sender: UIButton) {
        resultLabel.numberOfLines = 0
        numCardsSegmentControl.enabled = false
        
        if let resultText = game.flipCardAtIndex(indexOfButton(sender)) {
            if resultText != "" {
                resultLabel.text = resultText
                resultHistory.append(resultText)
                
                //make sure we don't get out of range errors; minus 1 to each
                historySlider.maximumValue = Float(resultHistory.count)-1
                historySlider.value = Float(resultHistory.count)-1
            }
        }
        ++flipCount
        updateUI()
    }
    
    func startNewGame(numCardMatch: Int) {
        game = CardMatchingGame(cardCount: cardButtons.count, deck: PlayingCardDeck(), numberOfCardsMatching: numCardMatch)
        flipCount = 0
        resultLabel.text = "Results"
        resultHistory = []
        historySlider.maximumValue = 1
        historySlider.value = 0.5
        
        //make sure that buttons that were disabled last game are now enabled
        for button in cardButtons {
            button.enabled = true
        }
        numCardsSegmentControl.enabled = true
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