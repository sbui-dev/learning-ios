//
//  ViewController.swift
//  Destini
//
//  Created by Philipp Muellauer on 01/09/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Our strings
    let story1 = "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: \"Need a ride, boy?\"."
    let answer1a = "I\'ll hop in. Thanks for the help!"
    let answer1b = "Better ask him if he\'s a murderer first."
    
    
    let story2 = "He nods slowly, unphased by the question."
    let answer2a = "At least he\'s honest. I\'ll climb in."
    let answer2b = "Wait, I know how to change a tire."
    
    let story3 = "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box."
    let answer3a = "I love Elton John! Hand him the cassette tape."
    let answer3b = "It\'s him or me! You take the knife and stab him."
    
    let story4 = "What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?"
    let story5 = "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in."
    let story6 = "You bond with the murderer while crooning verses of \"Can you feel the love tonight\". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: \"Try the pier.\""
    
    
    // UI Elements linked to the storyboard
    @IBOutlet weak var topButton: UIButton!         // Has TAG = 1
    @IBOutlet weak var bottomButton: UIButton!      // Has TAG = 2
    @IBOutlet weak var storyTextView: UILabel!
    
    @IBOutlet weak var restartButton: UIButton!

    var storyState : Int = 1    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStory()
    }
    
    
    @IBAction func restartPressed(_ sender: UIButton) {
        storyState = 1
        topButton.isHidden = false
        bottomButton.isHidden = false
        updateStory()
    }
    
    // User presses one of the buttons
    @IBAction func buttonPressed(_ sender: UIButton) {
        let answer = sender.tag
        
        if storyState == 1 && answer == 1 {
            storyState = 3
        }
        else if storyState == 1 && answer == 2 {
            storyState = 2
        }
        else if storyState == 2 && answer == 1 {
            storyState = 3
        }
        else if storyState == 2 && answer == 2 {
            storyState = 4
        }
        else if storyState == 3 && answer == 1 {
            storyState = 6
        }
        else if storyState == 3 && answer == 2 {
            storyState = 5
        }

        updateStory()
    
    }
    
    func updateStory() {
        if storyState == 1 {
            storyTextView.text = story1
            topButton.setTitle(answer1a, for: .normal)
            bottomButton.setTitle(answer1b, for: .normal)
            restartButton.isHidden = true
        }
        else if storyState == 2 {
            storyTextView.text = story2
            topButton.setTitle(answer2a, for: .normal)
            bottomButton.setTitle(answer2b, for: .normal)
        }
        else if storyState == 3 {
            storyTextView.text = story3
            topButton.setTitle(answer3a, for: .normal)
            bottomButton.setTitle(answer3b, for: .normal)
        }
        else if storyState == 4 {
            storyTextView.text = story4
            topButton.isHidden = true
            bottomButton.isHidden = true
            restartButton.isHidden = false
        }
        else if storyState == 5 {
            storyTextView.text = story5
            topButton.isHidden = true
            bottomButton.isHidden = true
            restartButton.isHidden = false
        }
        else if storyState == 6 {
            storyTextView.text = story6
            topButton.isHidden = true
            bottomButton.isHidden = true
            restartButton.isHidden = false
        }
    }
}

