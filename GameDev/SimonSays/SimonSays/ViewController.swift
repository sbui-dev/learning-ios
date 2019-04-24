//
//  ViewController.swift
//  SimonSays
//
//  Created by Steven Bui on 4/23/19.
//  Copyright © 2019 Steven Bui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var colorButtons: [CircularButton]!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet var playerLabels: [UILabel]!
    @IBOutlet var scoreLabels: [UILabel]!
    
    var currentPlayer = 0
    var scores = [0,0]
    
    var sequenceIndex = 0
    var colorSequence = [Int]()
    var colorsToTap = [Int]()
    
    var gameEnded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorButtons = colorButtons.sorted() {
            $0.tag < $1.tag
        }
        playerLabels = playerLabels.sorted() {
            $0.tag < $1.tag
        }
        scoreLabels = scoreLabels.sorted() {
            $0.tag < $1.tag
        }
        
        createNewGame()
    }
    
    func createNewGame() {
        colorSequence.removeAll()
        
        actionButton.setTitle("Start Game", for: .normal)
        actionButton.isEnabled = true
        
        for button in colorButtons {
            button.alpha = 0.5
            button.isEnabled = false
        }
    }
    
    func addNewColor() {
        colorSequence.append(Int(arc4random_uniform(UInt32(4))))
    }
    
    func playSequence() {
        if sequenceIndex < colorSequence.count {
            flash(button: colorButtons[colorSequence[sequenceIndex]])
            sequenceIndex += 1
        }
        else {
            colorsToTap = colorSequence
            view.isUserInteractionEnabled = true
            actionButton.setTitle("Tap the Circles", for: .normal)
            for button in colorButtons {
                button.isEnabled = true
            }
        }
    }
    
    func flash(button: CircularButton) {
        
        // create a flash by changing alpha of button
        UIView.animate(withDuration: 0.5, animations: {
            button.alpha = 1.0
            button.alpha = 0.5
        }) { (bool) in
            self.playSequence()
        }
    }

    @IBAction func colorButtonHandler(_ sender: CircularButton) {
        
        // check if user tap the correct colors
        if sender.tag == colorsToTap.removeFirst() {
            
        }
        else {
            for button in colorButtons {
                button.isEnabled = false
            }
            return
        }
        
        // user tapped all the correct colors
        if colorsToTap.isEmpty {
            for button in colorButtons {
                button.isEnabled = false
            }
            actionButton.setTitle("Continue", for: .normal)
            actionButton.isEnabled = true
        }
    }
    
    @IBAction func actionButtonHandler(_ sender: UIButton) {
        // reset sequence
        sequenceIndex = 0
        
        actionButton.setTitle("Memorize", for: .normal)
        actionButton.isEnabled = false
        
        // disable all UI
        view.isUserInteractionEnabled = false
        
        addNewColor()
        
        // delay by 1 second
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            self.playSequence()
        }
    }
    
}

