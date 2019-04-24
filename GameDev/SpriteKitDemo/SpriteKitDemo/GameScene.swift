//
//  GameScene.swift
//  SpriteKitDemo
//
//  Created by Steven Bui on 4/24/19.
//  Copyright © 2019 Steven Bui. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let myFirstNode = SKNode()
    let myFirstSpriteNode = SKSpriteNode(color: UIColor.red, size: CGSize(width: 200.0, height: 200.0))
    let myFirstTexturedSpriteNode = SKSpriteNode(imageNamed: "Spaceship")
    
    let blueBox = SKSpriteNode(color: UIColor.blue, size: CGSize(width: 100.0, height: 100.0))
    
    override func didMove(to view: SKView) {
        
        // blank node
        addChild(myFirstNode)
        
        // render red box as layer 1
        myFirstTexturedSpriteNode.zPosition = 1
        
        // adjust position of red box
        myFirstSpriteNode.position = CGPoint(x: frame.midX, y: frame.midY)
        myFirstSpriteNode.anchorPoint = CGPoint.zero
        
        // add red box to scene
        addChild(myFirstSpriteNode)
        
        // adjust size of space ship
        myFirstTexturedSpriteNode.size = CGSize(width: 100.0, height: 100.0)
        
        // add spaceship within the red box
        myFirstSpriteNode.addChild(myFirstTexturedSpriteNode)
        
        // render blue box on top of red by making blue box layer 2
        blueBox.zPosition = 2
        
        // position blue box in middle of red box
        blueBox.position = CGPoint(x: myFirstSpriteNode.size.width / 2, y: myFirstSpriteNode.size.height / 2)
        
        // add blue box to scene
        myFirstSpriteNode.addChild(blueBox)
    }
}
