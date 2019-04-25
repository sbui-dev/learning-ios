//
//  GameScene.swift
//  ColorSwitch
//
//  Created by Steven Bui on 4/25/19.
//  Copyright © 2019 Steven Bui. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {

    var colorCircle : SKSpriteNode!
    
    override func didMove(to view: SKView) {
        layoutScene()
    }
    
    func layoutScene() {
        backgroundColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
        
        colorCircle = SKSpriteNode(imageNamed: "ColorCircle")
        colorCircle.size = CGSize(width: frame.size.width/3, height: frame.size.width/3)
        colorCircle.position = CGPoint(x: frame.midX, y: frame.minY + colorCircle.size.height)
        
        addChild(colorCircle)
    }
    
    func spawnBall() {
        let ball = SKSpriteNode(imageNamed: "ball")
        ball.size = CGSize(width: 30.0, height: 30.0)
        ball.position = CGPoint(x: frame.midX, y: frame.maxY)
        addChild(ball)
    }
}
