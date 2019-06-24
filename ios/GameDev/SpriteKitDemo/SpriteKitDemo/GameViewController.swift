//
//  GameViewController.swift
//  SpriteKitDemo
//
//  Created by Steven Bui on 4/24/19.
//  Copyright © 2019 Steven Bui. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            //let scene = GameScene(size: view.bounds.size)
            if let scene = SKScene(fileNamed: "MyFirstTitleMapScene") {
            
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
                
                view.ignoresSiblingOrder = true
                
                view.showsFPS = true
                view.showsNodeCount = true
                view.showsPhysics = true
                
            }
        }
    }
}
