//
//  ViewController.swift
//  Magic8Ball
//
//  Created by Steven Bui on 3/21/19.
//  Copyright © 2019 Steven Bui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ball: UIImageView!
    var randomBallNumber = 0
    
    let ballArray = ["ball1", "ball2", "ball3", "ball5", "ball5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shakeBall()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        shakeBall()
    }
    
    @IBAction func askButton(_ sender: Any) {
        shakeBall()
    }

    func shakeBall(){
        randomBallNumber = Int.random(in: 0 ... 4)
        
        ball.image = UIImage(named: ballArray[randomBallNumber])
    }
}

