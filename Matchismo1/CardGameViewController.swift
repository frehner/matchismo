//
//  CardGameViewController.swift
//  Matchismo1
//
//  Created by Steve Liddle on 9/10/14.
//  Copyright (c) 2014 IS 543. All rights reserved.
//

import UIKit

class CardGameViewController : UIViewController {

    @IBOutlet weak var flipLabel: UILabel!

    var flipCount: Int = 0 {
        didSet {
            flipLabel.text = "Flips: \(flipCount)"
        }
    }

    @IBAction func flipCard(sender: UIButton) {
        sender.selected = !sender.selected
        ++flipCount
    }
}