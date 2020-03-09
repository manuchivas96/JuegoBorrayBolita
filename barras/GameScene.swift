//
//  GameScene.swift
//  barras
//
//  Created by CEDAM 25 on 03/03/20.
//  Copyright © 2020 UNAM. All rights reserved.
//

import SpriteKit
import GameplayKit
enum body{
    case Ready
    case Inplay
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    var Bloque = SKShapeNode(rectOf: CGSize(width: 100, height: 40), cornerRadius: 10)
    var ball =  Ball()
    var rect = Rect()
    var estado =  body.Ready
    
    //score
    var scoreLabel : SKLabelNode!
    var score:Int = 0 {
        didSet{
            scoreLabel.text = "Score \(score)"
        }
    }
    
    override func didMove(to view: SKView) {
        var colores:[UIColor] = [.green,.blue,.black,.darkGray,.red,.orange,.purple]
        
        //Bloque.fillColor = colores.randomElement()!
        physicsWorld.contactDelegate = self
        let width = Bloque.frame.width
        let heigth = Bloque.frame.height + 30
        
        for ancho in stride(from: 148, to: size.width-100, by: width + 10){
            for altura in stride(from: size.height/2, to: size.height - 100, by: heigth + 10){
                let BloqueAux = Bloque.copy() as! SKShapeNode
                BloqueAux.position = CGPoint(x: ancho, y: altura)
                BloqueAux.physicsBody = SKPhysicsBody(rectangleOf: BloqueAux.frame.size)
                BloqueAux.physicsBody?.isDynamic = false
                BloqueAux.strokeColor = colores.randomElement()!
                BloqueAux.physicsBody?.affectedByGravity = false
                BloqueAux.physicsBody?.contactTestBitMask = 1
                BloqueAux.physicsBody?.collisionBitMask = 1
                BloqueAux.physicsBody?.categoryBitMask = 2
                addChild(BloqueAux)
            }
        }
        positioBegan()
        addChild(ball)
        addChild(rect)
    }
    
    func positioBegan() {
         ball.position = CGPoint(x: size.width/2, y: 120)
        ball.position =  CGPoint(x: size.width/2, y: 90)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if estado == body.Ready{
            estado = .Inplay
            iniciarJuego()
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches{
            let location = t.location(in: self)
            rect.position.x = location.x
            
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        var BodyA =  contact.bodyA.node
        var BodyB = contact.bodyB.node
        if BodyA?.physicsBody?.categoryBitMask == 2
        {
            BodyA?.removeFromParent()
        }
        if BodyB?.physicsBody?.categoryBitMask == 2
        {
            BodyB?.removeFromParent()
        }
    }
    
    
    func iniciarJuego(){
        ball.physicsBody?.velocity = CGVector(dx: 120, dy: 300)
    }
    override func didSimulatePhysics() {
        if ball.position.x >= size.width - 100 || ball.position.x <= 100
        {
            ball.physicsBody?.velocity.dx *= -1
        }
        if ball.position.y >= size.height - 55
        {
            ball.physicsBody?.velocity.dy *= -1
        }
        if ball.position.y < -50
        {
            estado = .Ready
            ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
            positioBegan()
        }
    }
  
}
