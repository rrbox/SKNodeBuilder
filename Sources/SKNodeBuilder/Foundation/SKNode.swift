//
//  File.swift
//  
//
//  Created by rrbox on 2021/11/20.
//

import SpriteKit

/// name space of all SKNode subclass builder's modifiers.
public enum Standard {
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
    @discardableResult func position(_ value: CGPoint) -> Next<Standard.Position<Node>> {
        self.modifier(mod: Standard.Position(body: value))
    }
    
    /// スケールを変更します.
    @discardableResult func setScale(_ value: CGFloat) -> Next<Standard.Scale<Node>> {
        self.modifier(mod: Standard.Scale(body: value))
    }
    
    /// x スケールを変更します.
    @discardableResult func xScale(_ value: CGFloat) -> Next<Standard.XScale<Node>> {
        self.modifier(mod: Standard.XScale(body: value))
    }
    
    /// y スケールを変更します.
    @discardableResult func yScale(_ value: CGFloat) -> Next<Standard.YScale<Node>> {
        self.modifier(mod: Standard.YScale(body: value))
    }
    
    /// zPosition を変更します.
    @discardableResult func zPosition(_ value: CGFloat) -> Next<Standard.ZPosition<Node>> {
        self.modifier(mod: Standard.ZPosition(body: value))
    }
    
    /// zRotation を変更します.
    @discardableResult func zRotation(_ value: CGFloat) -> Next<Standard.ZRotation<Node>> {
        self.modifier(mod: Standard.ZRotation(body: value))
    }
    
    /// alpha を変更します.
    @discardableResult func alpha(_ value: CGFloat) -> Next<Standard.Alpha<Node>> {
        self.modifier(mod: Standard.Alpha(body: value))
    }
    
    /// name を変更します.
    @discardableResult func name(_ value: String?) -> Next<Standard.Name<Node>> {
        self.modifier(mod: Standard.Name(body: value))
    }
    
}
