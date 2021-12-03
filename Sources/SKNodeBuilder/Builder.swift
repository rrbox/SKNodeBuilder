//
//  File.swift
//  
//
//  Created by rrbox on 2021/11/20.
//

import SpriteKit
final public class Builder<Body: SKNode>: NSObject {
    let body: Body
    public init(_ body: Body) {
        self.body = body
    }
    public override init() {
        self.body = Body()
    }
    @discardableResult public func position(_ position: CGPoint) -> Self {
        self.body.position = position
        return self
    }
    @discardableResult public func alpha(_ alpha: CGFloat) -> Self {
        self.body.alpha = alpha
        return self
    }
    @discardableResult public func zRotation(_ zRotation: CGFloat) -> Self {
        self.body.zRotation = zRotation
        return self
    }
    @discardableResult public func zPosition(_ zPosition: CGFloat) -> Self {
        self.body.zPosition = zPosition
        return self
    }
    @discardableResult public func xScale(_ s: CGFloat) -> Self {
        self.body.xScale = s
        return self
    }
    @discardableResult public func yScale(_ s: CGFloat) -> Self {
        self.body.yScale = s
        return self
    }
    @discardableResult public func name(_ name: String?) -> Self {
        self.body.name = name
        return self
    }
    @discardableResult func physicsBody(_ physicsBody: SKPhysicsBody?) -> Self {
        self.body.physicsBody = physicsBody
        return self
    }
}

public extension SKNode {
    func addChild<Body: SKNode>(_ node: Builder<Body>) {
        self.addChild(node.body)
    }
}
public extension Builder {
    @discardableResult func addChild<Body: SKNode>(_ node: Builder<Body>) -> Self {
        self.body.addChild(node)
        return self
    }
}
