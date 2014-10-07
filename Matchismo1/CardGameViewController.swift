//
//  CardGameViewController.swift
//  Matchismo1
//
//  Created by Steve Liddle on 9/10/14.
//  Copyright (c) 2014 IS 543. All rights reserved.
//

import UIKit

class CardGameViewController : UIViewController {
    
    // MARK: Properties
    lazy var cards: [UIButton: Card]! = [UIButton: Card]()
    lazy var resultHistory: [String]! = []
    lazy var attributedStringResultHistory: [NSAttributedString]! = []
    var game: CardMatchingGame!
    internal lazy var resultString:String = ""
    let cardBack = UIImage(named: "CardBack")
    let cardFront = UIImage(named: "CardFront")
    internal var playableFaceUpCardIndicies:[Int] = []
    var flipCount: Int = 0 {
        didSet {
            flipLabel.text = "Flips: \(flipCount)"
        }
    }
    
    // MARK: Outlets
    @IBOutlet weak var numCardsSegmentControl: UISegmentedControl!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var flipLabel: UILabel!
    @IBOutlet weak var historySlider: UISlider!
    @IBOutlet var cardButtons: [UIButton]! {
        didSet {
            game = CardMatchingGame(cardCount: cardButtons.count, deck: PlayingCardDeck(), numberOfCardsMatching: 0)
        }
    }

    // MARK: Actions
    @IBAction func dealNewButton(sender: UIButton) {
        if getGameType() == "Matching" {
            startNewGame(numCardsSegmentControl.selectedSegmentIndex)
        } else {
            startNewGame(1)
        }
        
    }

    @IBAction func numCardsSegmentControlChange(sender: UISegmentedControl) {
        startNewGame(sender.selectedSegmentIndex)
    }
    @IBAction func historySliderChanged(sender: UISlider) {
        if Int(sender.value) < resultHistory.count - 1 {
            resultLabel.text = resultHistory[Int(sender.value)]
            resultLabel.alpha = 0.5
        } else {
            resultLabel.alpha = 1
        }
    }
    @IBAction func flipCard(sender: UIButton) {
        resultLabel.numberOfLines = 0
        
        if getGameType() == "Matching" {
            numCardsSegmentControl.enabled = false
        }
        
        //make sure that there are only a certain amount of cards face up at a time
        if playableFaceUpCardIndicies.count > game.getNumCardsMatching() {
            for cardIndexToFlip in playableFaceUpCardIndicies {
                game.flipCardAtIndex(cardIndexToFlip)
            }
            playableFaceUpCardIndicies = []
        }
        
        //removes a card from the array of cards if you flipped it again without getting a match or mismatch
        for (index, cardIndex) in enumerate(playableFaceUpCardIndicies) {
            if cardIndex == indexOfButton(sender) {
                playableFaceUpCardIndicies.removeAtIndex(index)
            }
        }
        
//        if let lastCard = playableFaceUpCardIndicies.last {
//            if lastCard == indexOfButton(sender) {
//                playableFaceUpCardIndicies.removeLast()
//            }
//        }
        
        if let resultText = game.flipCardAtIndex(indexOfButton(sender)) {
            if resultText != "" {
                
                resultLabel.text = resultText
                resultHistory.append(resultText)
                
                resultLabel.alpha = 1
                
                //make sure we don't get out of range errors; minus 1 to each
                historySlider.maximumValue = Float(resultHistory.count)-1
                historySlider.value = Float(resultHistory.count)-1
                
                playableFaceUpCardIndicies.append(indexOfButton(sender))
            }
        }
        ++flipCount
        updateUI()
    }
    
    // MARK: Helpers
    func startNewGame(numCardMatch: Int) {
        //reset ALL THE THINGS
        
        if getGameType() == "Matching" {
            game = CardMatchingGame(cardCount: cardButtons.count, deck: PlayingCardDeck(), numberOfCardsMatching: numCardMatch)
        } else {
            game = CardMatchingGame(cardCount: cardButtons.count, deck: SetCardDeck(), numberOfCardsMatching: numCardMatch)
        }
        
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
        
        if getGameType() == "Matching" {
            numCardsSegmentControl.enabled = true
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
                
                if getGameType() == "Set" {
                    button.alpha = 0.5
                }
                
            } else {
                
                switch getGameType(){
                case "Set":
                    
                    if let setCard = card as? SetCard {
                        
                        var finalContent = getSetCardAttributedString(cardToGetAttributedString: setCard)
                        button.setAttributedTitle(finalContent, forState: .Normal)
                        button.alpha = 1
                    }
                    
                default:
                    button.setTitle("", forState: .Normal)
                }
                
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
    
    func getGameType() -> String {
        return "Matching"
    }
    
    func getSetCardAttributedString(cardToGetAttributedString setCard :SetCard) -> NSAttributedString {
        return NSAttributedString()
    }
    
}