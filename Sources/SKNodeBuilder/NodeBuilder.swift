//
//  File.swift
//  
//
//  Created by rrbox on 2021/11/20.
//
import SpriteKit

@propertyWrapper
public struct NodeBuilder<Body: SKNode> {
    public var wrappedValue: Body
    public init(wrappedValue: Body) {
        self.wrappedValue = wrappedValue
    }
    public var projectedValue: Node<Body> {
        Node(self.wrappedValue)
    }
}
