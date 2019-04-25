//
//  GameScene.swift
//  ColorSwitch
//
//  Created by Steven Bui on 4/25/19.
//  Copyright © 2019 Steven Bui. All rights reserved.
//

import SpriteKit

enum PlayColors {
    static let colors = [
        UIColor(red: 231/255, green: 76/255, blue: 60/255, alpha: 1.0),
        UIColor(red: 241/255, green: 196/255, blue: 15/255, alpha: 1.0),
        UIColor(red: 46/255, green: 204/255, blue: 113/255, alpha: 1.0),
        UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
    ]
}

enum SwitchState : Int {
    case red, yellow, green, blue
}

class GameScene: SKScene {

    var ColorSwitch : SKSpriteNode!
    var switchState = SwitchState.red
    var currentColorIndex : Int?
    
    override func didMove(to view: SKView) {
        setupPhysics()
        layoutScene()
    }
    
    func setupPhysics() {
        physicsWorld.gravity = CGVector(dx: 0.0, dy: -2.0)
        physicsWorld.contactDelegate = self
    }
    
    func layoutScene() {
        backgroundColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
        
        ColorSwitch = SKSpriteNode(imageNamed: "ColorCircle")
        ColorSwitch.size = CGSize(width: frame.size.width/3, height: frame.size.width/3)
        ColorSwitch.position = CGPoint(x: frame.midX, y: frame.minY + ColorSwitch.size.height)
        ColorSwitch.physicsBody = SKPhysicsBody(circleOfRadius: ColorSwitch.size.width/2)
        ColorSwitch.physicsBody?.categoryBitMask = PhysicsCategories.switchCategory
        ColorSwitch.physicsBody?.isDynamic = false
        
        addChild(ColorSwitch)
        
        spawnBall()
    }
    
    func spawnBall() {
        currentColorIndex = Int(arc4random_uniform(UInt32(4)))
        
        let ball = SKSpriteNode(texture: SKTexture(imageNamed: "ball"), color: PlayColors.colors[currentColorIndex!], size: CGSize(width: 30.0, height: 30.0))
        ball.colorBlendFactor = 1 // makes sure color is applied to texture
        ball.name = "Ball"
        ball.position = CGPoint(x: frame.midX, y: frame.maxY)
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width/2)
        ball.physicsBody?.categoryBitMask = PhysicsCategories.ballCategory
        ball.physicsBody?.contactTestBitMask = PhysicsCategories.switchCategory
        ball.physicsBody?.collisionBitMask = PhysicsCategories.none
        
        addChild(ball)
    }
    
    func turnWheel() {
        if let newState = SwitchState(rawValue: switchState.rawValue + 1) {
            switchState = newState
        }
        else {
            switchState = .red
        }
        
        ColorSwitch.run(SKAction.rotate(byAngle: .pi/2, duration: 0.25))
    }
    
    func gameOver() {
        print("Game over")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        turnWheel()
    }
}

extension GameScene : SKPhysicsContactDelegate {
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        if contactMask == PhysicsCategories.ballCategory | PhysicsCategories.switchCategory {
            if let ball = contact.bodyA.node?.name == "Ball" ? contact.bodyA.node as? SKSpriteNode : contact.bodyB.node as? SKSpriteNode {
                if currentColorIndex == switchState.rawValue {
                    print("Correct")
                    
                    ball.run(SKAction.fadeOut(withDuration: 0.25)) {
                        ball.removeFromParent()
                        self.spawnBall()
                    }
                }
                else {
                    gameOver()
                }
            }
        }
    }
}
