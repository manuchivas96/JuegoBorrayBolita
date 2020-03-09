//
//  Ball.swift
//  barras
//
//  Created by CEDAM 25 on 03/03/20.
//  Copyright © 2020 UNAM. All rights reserved.
//

import UIKit
import SpriteKit
class Ball: SKNode {
    var ball = SKShapeNode(circleOfRadius: 30)
    override init()
    {
        super.init()
       
        ball.fillColor = .yellow
        addChild(ball)
        //object to the physicsBody property of the SKNode object to add physics simulation to the node.
        physicsBody = SKPhysicsBody(circleOfRadius: 15)
        //Si el valor es falso, el cuerpo de física ignora todas las fuerzas e impulsos que se le aplican
        physicsBody?.isDynamic = true
        //La propiedad de gravedad del mundo de la física define las fuerzas gravitacionales aplicadas a los cuerpos basados en el volumen en la escena.
        physicsBody?.affectedByGravity = false
        //Esta propiedad se utiliza para simular fuerzas de fricción de fluido o aire en el cuerpo
        physicsBody?.linearDamping = 0
        physicsBody?.angularDamping = 0
        physicsBody?.friction = 0.5
        //Esta propiedad se utiliza para determinar cuánta energía pierde el cuerpo físico cuando rebota en otro objeto.
        physicsBody?.restitution = 1
       // Cada cuerpo de física en una escena puede asignarse a hasta 32 categorías diferentes, cada una correspondiente a un bit en la máscara de bits.
        physicsBody?.categoryBitMask = 1
        //El valor por defecto es verdadero. Esta propiedad se ignora en los cuerpos basados en bordes, que no se ven afectados por las fuerzas en el sistema.
        physicsBody?.allowsRotation = true
        //Cuando dos cuerpos comparten el mismo espacio, la máscara de categoría de cada cuerpo se prueba contra la máscara de contacto del otro cuerpo realizando una operación AND lógica.
        physicsBody?.contactTestBitMask = 2
         //La máscara de colisión de este cuerpo se compara con la máscara de categoría del otro cuerpo realizando una operación AND lógica. Si el resultado es un valor distinto de cero, este cuerpo se ve afectado por la colisión.
        physicsBody?.collisionBitMask = 2
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
