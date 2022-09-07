//
//  File.swift
//  
//
//  Created by rrbox on 2021/11/20.
//

import SpriteKit

/// Name space of all SKNode subclass builder's modifiers.
public enum StandardModifiers {
    /// 座標変更のためのモディファイアです.
    public struct Position<Node: SKNode>: Modifier {
        public var body: CGPoint
        
        public func mod(node: Node) {
            node.position = self.body
        }
    }

    /// x, y スケールを変更するためのモディファイアです.
    public struct Scale<Node: SKNode>: Modifier {
        public var body: CGFloat
        
        public func mod(node: Node) {
            node.setScale(self.body)
        }
    }

    /// x スケールを変更するためのモディファイアです.
    public struct XScale<Node: SKNode>: Modifier {
        public var body: CGFloat
        
        public func mod(node: Node) {
            node.xScale = self.body
        }
    }

    /// y スケールを変更するためのモディファイアです.
    public struct YScale<Node: SKNode>: Modifier {
        public var body: CGFloat
        
        public func mod(node: Node) {
            node.yScale = self.body
        }
    }

    /// zPosition を変更するためのモディファイアです.
    public struct ZPosition<Node: SKNode>: Modifier {
        public var body: CGFloat
        
        public func mod(node: Node) {
            node.zPosition = self.body
        }
    }

    /// zRotation を変更するためのモディファイアです.
    public struct ZRotation<Node: SKNode>: Modifier {
        public var body: CGFloat
        
        public func mod(node: Node) {
            node.zRotation = self.body
        }
    }

    /// alpha を変更するためのモディファイアです.
    public struct Alpha<Node: SKNode>: Modifier {
        var body: CGFloat
        
        public func mod(node: Node) {
            node.alpha = self.body
        }
    }

    /// name を変更するためのモディファイアです.
    public struct Name<Node: SKNode>: Modifier {
        var body: String?
        
        public func mod(node: Node) {
            node.name = self.body
        }
    }

}

public extension BuilderProtocol {
    /// 座標を変更します.
    @discardableResult func position(_ value: CGPoint) -> Next<StandardModifiers.Position<Node>> {
        self.modifier(mod: StandardModifiers.Position(body: value))
    }
    
    /// スケールを変更します.
    @discardableResult func setScale(_ value: CGFloat) -> Next<StandardModifiers.Scale<Node>> {
        self.modifier(mod: StandardModifiers.Scale(body: value))
    }
    
    /// x スケールを変更します.
    @discardableResult func xScale(_ value: CGFloat) -> Next<StandardModifiers.XScale<Node>> {
        self.modifier(mod: StandardModifiers.XScale(body: value))
    }
    
    /// y スケールを変更します.
    @discardableResult func yScale(_ value: CGFloat) -> Next<StandardModifiers.YScale<Node>> {
        self.modifier(mod: StandardModifiers.YScale(body: value))
    }
    
    /// zPosition を変更します.
    @discardableResult func zPosition(_ value: CGFloat) -> Next<StandardModifiers.ZPosition<Node>> {
        self.modifier(mod: StandardModifiers.ZPosition(body: value))
    }
    
    /// zRotation を変更します.
    @discardableResult func zRotation(_ value: CGFloat) -> Next<StandardModifiers.ZRotation<Node>> {
        self.modifier(mod: StandardModifiers.ZRotation(body: value))
    }
    
    /// alpha を変更します.
    @discardableResult func alpha(_ value: CGFloat) -> Next<StandardModifiers.Alpha<Node>> {
        self.modifier(mod: StandardModifiers.Alpha(body: value))
    }
    
    /// name を変更します.
    @discardableResult func name(_ value: String?) -> Next<StandardModifiers.Name<Node>> {
        self.modifier(mod: StandardModifiers.Name(body: value))
    }
    
}
