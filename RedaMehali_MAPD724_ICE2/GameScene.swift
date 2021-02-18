//
//  GameScene.swift
//  RedaMehali_MAPD724_ICE2
//
//  Created by Reda Mehali on 2/16/21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var skSpriteNode: SKNode! = nil
    
    override func didMove(to view: SKView) {
        skSpriteNode = SKSpriteNode(color: .red, size: CGSize(width: 100, height: 100))
        self.addChild(skSpriteNode)
    }
    
    override func update(_ currentTime: TimeInterval) {
        moveUp()
    }
    
    func moveUp() {
        let moveUp = SKAction.moveBy(x: 0, y: 5, duration: 0)
        skSpriteNode.run(moveUp, withKey: "moveUp")
        checkBounds()
    }
    
    func reset() {
        let resetDown = SKAction.moveBy(x: 0, y: -700, duration: 0)
        skSpriteNode.run(resetDown, withKey: "resetDown")
    }
    
    func checkBounds() {
        if (skSpriteNode.position.y >= 700) {
            reset()
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    }
    
    func touchUp(atPoint pos : CGPoint) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let label = self.label {
            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
        }
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
}
