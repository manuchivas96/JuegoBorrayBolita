//
//  rect.swift
//  barras
//
//  Created by CEDAM 25 on 04/03/20.
//  Copyright © 2020 UNAM. All rights reserved.
//

import UIKit
import SpriteKit
class Rect: SKNode {
    var rect = SKShapeNode(rectOf: CGSize(width: 100, height: 20))
    override init()
    {
        super.init()
        physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 120, height: 30))
        rect.fillColor = .yellow
        physicsBody?.isDynamic = false
        physicsBody?.affectedByGravity =  false
        physicsBody?.categoryBitMask = 3
        physicsBody?.allowsRotation = false
        physicsBody?.contactTestBitMask = 1
        physicsBody?.collisionBitMask = 1
        addChild(rect)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

