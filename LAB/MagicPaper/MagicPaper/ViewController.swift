//
//  ViewController.swift
//  MagicPaper
//
//  Created by Steven Bui on 4/22/19.
//  Copyright © 2019 Steven Bui. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARImageTrackingConfiguration()
        
        // images to track in assets folder
        if let imageToTrack = ARReferenceImage.referenceImages(inGroupNamed: "NewsPaperImages", bundle: Bundle.main) {
            
            configuration.trackingImages = imageToTrack
            
            configuration.maximumNumberOfTrackedImages = 1
            
            print("image found")
        }

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    

    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
        
         if let imageAnchor = anchor as? ARImageAnchor {
            
            // add video
            let videoNode = SKVideoNode(fileNamed: "harrypotter.mp4")
            
            videoNode.play()
            
            let videoScene = SKScene(size: CGSize(width: 480, height: 360))
            
            // center video on plane
            videoNode.position = CGPoint(x: videoScene.size.width / 2, y: videoScene.size.height / 2)
            
            // flip upside down video right side up
            videoNode.yScale = -1.0
            
            videoScene.addChild(videoNode)
            
            // create a plane on the card
            let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
            
            // makes the plane white and transparent
            plane.firstMaterial?.diffuse.contents = videoScene
            
            let planeNode = SCNNode(geometry: plane)
            
            // make the plane flat
            planeNode.eulerAngles.x = -.pi / 2
            
            node.addChildNode(planeNode)
        }
     
        return node
    }

}
