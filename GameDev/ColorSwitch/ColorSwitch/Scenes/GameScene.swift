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
        setupPhysics()
        layoutScene()
    }
    
    func setupPhysics() {
        physicsWorld.gravity = CGVector(dx: 0.0, dy: -2.0)
    }
    
    func layoutScene() {
        backgroundColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
        
        colorCircle = SKSpriteNode(imageNamed: "ColorCircle")
        colorCircle.size = CGSize(width: frame.size.width/3, height: frame.size.width/3)
        colorCircle.position = CGPoint(x: frame.midX, y: frame.minY + colorCircle.size.height)
        colorCircle.physicsBody = SKPhysicsBody(circleOfRadius: colorCircle.size.width/2)
        colorCircle.physicsBody?.categoryBitMask = PhysicsCategories.switchCategory
        colorCircle.physicsBody?.isDynamic = false
        
        addChild(colorCircle)
        
        spawnBall()
    }
    
    func spawnBall() {
        let ball = SKSpriteNode(imageNamed: "ball")
        ball.size = CGSize(width: 30.0, height: 30.0)
        ball.position = CGPoint(x: frame.midX, y: frame.maxY)
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width/2)
        ball.physicsBody?.categoryBitMask = PhysicsCategories.ballCategory
        ball.physicsBody?.contactTestBitMask = PhysicsCategories.switchCategory
        ball.physicsBody?.collisionBitMask = PhysicsCategories.none
        
        addChild(ball)
    }
}
