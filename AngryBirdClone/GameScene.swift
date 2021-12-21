//
//  GameScene.swift
//  AngryBirdClone
//
//  Created by Nurşah on 21.12.2021.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {

    var bird = SKSpriteNode()
    var box1 = SKSpriteNode()
    var box2 = SKSpriteNode()
    var box3 = SKSpriteNode()
    var box4 = SKSpriteNode()
    var box5 = SKSpriteNode()
    var counter = SKLabelNode()
    var sayac = 0
    var gameStarted = false
    var originalPos: CGPoint?
    
    enum ColliderType: UInt32 {
        case Bird = 1
        case Box = 2
    }
    
    override func didMove(to view: SKView) {
        /*let texture = SKTexture(imageNamed: "bird")
        bird2 = SKSpriteNode(texture: texture)
        bird2.position = CGPoint(x: -550, y: -120)
        bird2.size = CGSize(width: self.frame.width / 18, height: self.frame.height / 13)
        bird2.zPosition  = 1
        self.addChild(bird2)*/
        
        /*counter.fontName = "Helvetica"
        counter.fontSize = 60
        counter.text = "0"
        counter.position = CGPoint(x: 0, y: self.frame.height / 4)
        counter.zPosition = 2
        self.addChild(counter)*/
        
        counter = childNode(withName: "counter") as! SKLabelNode
        
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.scene?.scaleMode = .aspectFit
        self.physicsWorld.contactDelegate = self
        
        bird = childNode(withName: "bird") as! SKSpriteNode
        
        let birdTexture = SKTexture(imageNamed: "bird")
        bird.physicsBody = SKPhysicsBody(circleOfRadius: birdTexture.size().height / 18)
        bird.physicsBody?.affectedByGravity = false
        bird.physicsBody?.isDynamic = true
        bird.physicsBody?.mass = 0.3
        originalPos = bird.position
        
        bird.physicsBody?.contactTestBitMask = ColliderType.Bird.rawValue
        bird.physicsBody?.categoryBitMask = ColliderType.Bird.rawValue
        bird.physicsBody?.collisionBitMask = ColliderType.Box.rawValue

    
        box1 = childNode(withName: "box1") as! SKSpriteNode
        let box1Text = SKTexture(imageNamed: "box1")
        box1.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.width / 13, height: self.frame.height / 8))
        box1.physicsBody?.affectedByGravity = true
        box1.physicsBody?.isDynamic = true
        box1.physicsBody?.mass = 0.4
        
        box1.physicsBody?.collisionBitMask = ColliderType.Bird.rawValue
        
        box2 = childNode(withName: "box2") as! SKSpriteNode
        let box2Text = SKTexture(imageNamed: "box2")
        box2.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.width / 13, height: self.frame.height / 8))
        box2.physicsBody?.affectedByGravity = true
        box2.physicsBody?.isDynamic = true
        box2.physicsBody?.mass = 0.4
        
        box2.physicsBody?.collisionBitMask = ColliderType.Bird.rawValue
        
        box3 = childNode(withName: "box3") as! SKSpriteNode
        let box3Text = SKTexture(imageNamed: "box3")
        box3.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.width / 13, height: self.frame.height / 8))
        box3.physicsBody?.affectedByGravity = true
        box3.physicsBody?.isDynamic = true
        box3.physicsBody?.mass = 0.4
        
        box3.physicsBody?.collisionBitMask = ColliderType.Bird.rawValue
        
        box4 = childNode(withName: "box4") as! SKSpriteNode
        let box4Text = SKTexture(imageNamed: "box4")
        box4.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.width / 13, height: self.frame.height / 8))
        box4.physicsBody?.affectedByGravity = true
        box4.physicsBody?.isDynamic = true
        box4.physicsBody?.mass = 0.4
        
        box4.physicsBody?.collisionBitMask = ColliderType.Bird.rawValue
        
        box5 = childNode(withName: "box5") as! SKSpriteNode
        let box5Text = SKTexture(imageNamed: "box5")
        box5.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.width / 13, height: self.frame.height / 8))
        box5.physicsBody?.affectedByGravity = true
        box5.physicsBody?.isDynamic = true
        box5.physicsBody?.mass = 0.4
        
        box5.physicsBody?.collisionBitMask = ColliderType.Bird.rawValue
        
    }
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.collisionBitMask == ColliderType.Bird.rawValue || contact.bodyB.collisionBitMask == ColliderType.Bird.rawValue {
            sayac = sayac + 1
            counter.text = String(sayac)
        }
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
       
    }
    
    func touchMoved(toPoint pos : CGPoint) {
       
    }
    
    func touchUp(atPoint pos : CGPoint) {
   
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       // bird.physicsBody?.affectedByGravity = true
       // bird.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 200))
        if gameStarted == false {
            if let touch = touches.first {
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    for node in touchNodes {
                        if let sprite = node as? SKSpriteNode {
                            if sprite == bird {
                                bird.position = touchLocation
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if gameStarted == false {
            if let touch = touches.first {
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    for node in touchNodes {
                        if let sprite = node as? SKSpriteNode {
                            if sprite == bird {
                                bird.position = touchLocation
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if gameStarted == false {
            if let touch = touches.first {
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    for node in touchNodes {
                        if let sprite = node as? SKSpriteNode {
                            if sprite == bird {
                                let dx = -(touchLocation.x - originalPos!.x)
                                let dy = -(touchLocation.y - originalPos!.y)
                                
                                let impulse = CGVector(dx: dx, dy: dy)
                                
                                bird.physicsBody?.applyImpulse(impulse)
                                bird.physicsBody?.affectedByGravity = true
                                gameStarted = true
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
      
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        if let birdBody = bird.physicsBody {
            if birdBody.velocity.dx <= 0.1 && birdBody.velocity.dy <= 0.1 && birdBody.angularVelocity <= 0.1 && gameStarted == true{
                bird.physicsBody?.affectedByGravity = false
                bird.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
                bird.physicsBody?.angularVelocity = 0
                bird.zPosition = 1
                bird.position = originalPos!
                sayac = 0
                counter.text = String(sayac)
                gameStarted = false
                
            }
        }
    }
}
