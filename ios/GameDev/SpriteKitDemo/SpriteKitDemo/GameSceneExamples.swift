//
//  GameScene.swift
//  SpriteKitDemo
//
//  Created by Steven Bui on 4/24/19.
//  Copyright © 2019 Steven Bui. All rights reserved.
//

import SpriteKit

class GameSceneExamples: SKScene {
    
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
 
    // different actions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
 /*
        // move space ship to top right of red box
        //myFirstTexturedSpriteNode.run(SKAction.move(to: CGPoint(x: myFirstSpriteNode.size.width, y: myFirstSpriteNode.size.height), duration: 2.0))
        
        // rotate blue box
        //blueBox.run(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 2.0))
        
        // move space shipe to top right of red box and reset
        myFirstTexturedSpriteNode.run(SKAction.move(to: CGPoint(x: myFirstSpriteNode.size.width, y: myFirstSpriteNode.size.height), duration: 2.0)) {
            self.myFirstTexturedSpriteNode.position = CGPoint.zero
        }
        
        if !blueBox.hasActions() {
            // rotate blue box forever
            //blueBox.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 2.0)))
        
            // multiple actions at the same time: rotate and scale smaller
            //blueBox.run(SKAction.group([SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 2.0), SKAction.scale(by: 0.9, duration: 2.0)]))
            
            // multiple actions in a sequence: rotate then scale smaller
            blueBox.run(SKAction.sequence([SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 2.0), SKAction.scale(by: 0.9, duration: 2.0)]))
        }
        else {
            blueBox.removeAllActions()
        }
 */
        // _ doesn't save the action. just checks if it exists
        if let _ = myFirstTexturedSpriteNode.action(forKey: "Rotation") {
            myFirstTexturedSpriteNode.removeAction(forKey: "Rotation")
        }
        else {
            myFirstTexturedSpriteNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 2.0)), withKey: "Rotation")
        }
    }
}
