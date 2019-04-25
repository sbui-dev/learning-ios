//
//  GameScene.swift
//  SpriteKitDemo
//
//  Created by Steven Bui on 4/24/19.
//  Copyright © 2019 Steven Bui. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        
    }

    override func update(_ currentTime: TimeInterval) {
        print("1")
    }
    
    override func didEvaluateActions() {
        print("2")
    }
    
    override func didSimulatePhysics() {
        print("3")
    }
    
    override func didApplyConstraints() {
        print("4")
    }
    
    override func didFinishUpdate() {
        print("5")
        isPaused = true
    }
}
