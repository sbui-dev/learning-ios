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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func colorButtonHandler(_ sender: CircularButton) {
        
    }
    
    @IBAction func actionButtonHandler(_ sender: UIButton) {
        
    }
    
}

