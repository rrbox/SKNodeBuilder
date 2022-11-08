//
//  SKNode.swift
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
    
    /// ``doc:SKNodeBuilder/ProcessorProtocol/addChild(builder:)`` を行うためのモディフィアです.
    /// ビルダーオブジェクトから `node()` メソッドにより生成さたノードを子ノードとして追加します.
    public struct AddChildBuilder<Generator: GeneratorProtocol, T: ProcessorProtocol, Node: SKNode> where Generator.Node == T.Mod.Node {
        
        var body: Builder<Generator, T>
        
//        public func mod(node: Node) {
//            node.addChild(self.body.node())
//        }
//
    }
    
    ///  ``doc:SKNodeBuilder/ProcessorProtocol/addChild(_:withNode:)``を行うためのモディフィアです.
    ///
    /// ビルダーオブジェクトから `process(node:)` メソッドで編集されたノードを子ノードとして追加します.
    public struct AddChildWithNode<T: ProcessorProtocol, Node: SKNode>: Modifier {
        
        var body: T
        unowned let childNode: T.Node
        
        public func mod(node: Node) {
//            ここで signal SIGABRT エラーが出た場合, 設定したノードのメモリが解放されている可能性があります.
            node.addChild(self.body.process(node: self.childNode))
        }
        
    }
    
    /// ``doc:SKNodeBuilder/ProcessorProtocol/addChild(_:)`` を行うためのモディフィアです.
    ///
    /// ノードをそのまま子ノードとして追加します.
    public struct AddChild<T: SKNode, Node: SKNode>: Modifier {
        
        unowned let body: T
        
        public func mod(node: Node) {
//            ここで signal SIGABRT エラーが出た場合, 設定したノードのメモリが解放されている可能性があります.
            node.addChild(self.body)
        }
        
    }


}

extension StandardModifiers.AddChildBuilder: Modifier where Generator: DefaultNodeGenerator {
    public func mod(node: Node) {
        node.addChild(self.body.node())
    }
}

public extension ProcessorProtocol {
    
    /// 座標を変更します.
    func position(_ value: CGPoint) -> Next<StandardModifiers.Position<Node>> {
        self.modifier(mod: StandardModifiers.Position(body: value))
    }
    
    /// スケールを変更します.
    func setScale(_ value: CGFloat) -> Next<StandardModifiers.Scale<Node>> {
        self.modifier(mod: StandardModifiers.Scale(body: value))
    }
    
    /// x スケールを変更します.
    func xScale(_ value: CGFloat) -> Next<StandardModifiers.XScale<Node>> {
        self.modifier(mod: StandardModifiers.XScale(body: value))
    }
    
    /// y スケールを変更します.
    func yScale(_ value: CGFloat) -> Next<StandardModifiers.YScale<Node>> {
        self.modifier(mod: StandardModifiers.YScale(body: value))
    }
    
    /// zPosition を変更します.
    func zPosition(_ value: CGFloat) -> Next<StandardModifiers.ZPosition<Node>> {
        self.modifier(mod: StandardModifiers.ZPosition(body: value))
    }
    
    /// zRotation を変更します.
    func zRotation(_ value: CGFloat) -> Next<StandardModifiers.ZRotation<Node>> {
        self.modifier(mod: StandardModifiers.ZRotation(body: value))
    }
    
    /// alpha を変更します.
    func alpha(_ value: CGFloat) -> Next<StandardModifiers.Alpha<Node>> {
        self.modifier(mod: StandardModifiers.Alpha(body: value))
    }
    
    /// name を変更します.
    func name(_ value: String?) -> Next<StandardModifiers.Name<Node>> {
        self.modifier(mod: StandardModifiers.Name(body: value))
    }
    
    /// 子ノードをビルダーで作成し, 追加します.
    ///
    /// [Modifier](doc:SKNodeBuilder/StandardModifiers/AddChildBuilder) をラップしたメソッドです.
    func addChild<Generator: GeneratorProtocol, T: ProcessorProtocol>(builder value: Builder<Generator, T>) -> Next<StandardModifiers.AddChildBuilder<Generator, T, Node>> where Generator: DefaultNodeGenerator {
        self.modifier(mod: StandardModifiers.AddChildBuilder(body: value))
    }
    
    /// 子ノードをビルダーで作成し, 追加します.
    ///
    /// [Modifier](doc:SKNodeBuilder/StandardModifiers/AddChildWithNode) をラップしたメソッドです.
    /// - attention: `process(node:)` など, 編集フローとしてビルダーを使用する場合, 子ノードの取り合いが発生することがあります.
    /// - attention: 引数に `SKSpriteNode(color:, size:)` のように直接インスタンス化して参照をセットすると, エラーが起こります. これはModifier が参照を unowned で所持するためです. 直接インスタンス化したい場合は `addChild<T: ProcessorProtocol>(_ : T)` を使ってください.
    func addChild<T: ProcessorProtocol>(_ value: T, withNode node: T.Node) -> Next<StandardModifiers.AddChildWithNode<T, Node>> {
        self.modifier(mod: StandardModifiers.AddChildWithNode(body: value, childNode: node))
    }
    
    /// 子ノードを直接追加します.
    ///
    /// [Modifier](doc:SKNodeBuilder/StandardModifiers/AddChild) をラップしたメソッドです.
    /// - attention: `process(node:)` など, 編集フローとしてビルダーを使用する場合, 子ノードの取り合いが発生することがあります.
    /// - attention: 引数に `SKSpriteNode(color:, size:)` のように直接インスタンス化して参照をセットすると, エラーが起こります. これはModifier が参照を unowned で所持するためです. 直接インスタンス化したい場合は `addChild<T: ProcessorProtocol>(_ : T)` を使ってください.
    func addChild<T: SKNode>(_ value: T) -> Next<StandardModifiers.AddChild<T, Node>> {
        self.modifier(mod: StandardModifiers.AddChild(body: value))
    }
    
}
