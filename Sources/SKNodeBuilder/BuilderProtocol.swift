//
//  File.swift
//  
//
//  Created by rrbox on 2021/11/20.
//

import SpriteKit


public protocol BuilderProtocol {
    
    associatedtype Body: SKNode
    
    var node: Body { get }
    
}


public extension BuilderProtocol {
    
    @discardableResult func position(_ value: CGPoint) -> Self {
        self.node.position = value
        return self
    }
    
    @discardableResult func zPosition(_ value: CGFloat) -> Self {
        self.node.zPosition = value
        return self
    }
    
    @discardableResult func zRotation(_ value: CGFloat) -> Self {
        self.node.zRotation = value
        return self
    }
    
    @discardableResult func setScale(_ value: CGFloat) -> Self {
        self.node.setScale(value)
        return self
    }
    
    @discardableResult func alpha(_ value: CGFloat) -> Self {
        self.node.alpha = value
        return self
    }
    
    @discardableResult func xScale(_ value: CGFloat) -> Self {
        self.node.xScale = value
        return self
    }
    
    @discardableResult func yScale(_ value: CGFloat) -> Self {
        self.node.yScale = value
        return self
    }
    
    @discardableResult func name(_ value: String?) -> Self {
        self.node.name = value
        return self
    }
    
    @discardableResult func physicsBody(_ value: SKPhysicsBody?) -> Self {
        self.node.physicsBody = value
        return self
    }
    
    @discardableResult func constrains(_ value: [SKConstraint]?) -> Self {
        self.node.constraints = value
        return self
    }
    
    @discardableResult func isUserInteractionEnabled(_ value: Bool) -> Self {
        self.node.isUserInteractionEnabled = value
        return self
    }
    
}
