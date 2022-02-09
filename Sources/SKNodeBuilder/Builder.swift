//
//  File.swift
//  
//
//  Created by rrbox on 2021/11/20.
//

import SpriteKit

final public class Builder<Body: SKNode>: NSObject, BuilderProtocol {
    
    public var node: Body {
        self.body
    }
    
    private let body: Body
    
    init(_ body: Body) {
        self.body = body
    }
    
    public override init() {
        self.body = Body()
    }
    
    public init?(fileNamed filename: String) {
        if let body = Body(fileNamed: filename) {
            self.body = body
        } else {
            return nil
        }
    }
    
    public init(fileNamed filename: String, securelyWithClasses classes: Set<AnyHashable>) throws {
        try self.body = Body(fileNamed: filename, securelyWithClasses: classes)
    }
    
}

final public class ChildNodeBuilder<Body: SKNode>: NSObject, BuilderProtocol {
    
    public var node: Body {
        self.body
    }
    
    private unowned let body: Body
    
    internal init(_ body: Body) {
        self.body = body
    }
    
}

public extension BuilderProtocol {
    
    @discardableResult func add<Node: SKNode>(child builer: Builder<Node>) -> Self {
        self.node.addChild(builer.node)
        return self
    }
    
    @discardableResult func add<Node: SKNode>(child node: Node, build: (ChildNodeBuilder<Node>) -> () = {_ in}) -> Self {
        self.node.addChild(node)
        build(ChildNodeBuilder<Node>(node))
        return self
    }
    
    @discardableResult func insert<Node: SKNode>(child node: Node, at index: Int, build: (ChildNodeBuilder<Node>) -> () = {_ in}) -> Self {
        self.node.insertChild(node, at: index)
        build(ChildNodeBuilder<Node>(node))
        return self
    }
    
}
