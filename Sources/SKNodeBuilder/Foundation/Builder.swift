//
//  File.swift
//  
//
//  Created by rrbox on 2021/11/20.
//

import SpriteKit

/// モディファイアを作成します. 変更対象のノード は `mod(node:)` で取得します.
///
/// 作成した modifier オブジェクトは, BuilderProtocol の `modifier(mod:)` にセットして使用します.
public protocol Modifier {
    /// SKNode のサブクラス.
    associatedtype Node: SKNode
    
    /// Node 型のオブジェクトに対する変更を定義します.
    func mod(node: Node)
    
}

/// ビルダーを定義します.
public protocol BuilderProtocol {
    associatedtype Mod: Modifier
    var modData: Mod { get set }
    func mod(node: Mod.Node)
    
}

public extension BuilderProtocol {
    typealias Next<T: Modifier> = Link<Self, T> where T.Node == Self.Node
    typealias Node = Self.Mod.Node
    
    /// 定義されたビルダーからノードを生成します.
    ///
    /// Node の型によらず, ノードの生成は `Node()` から開始されます.
    func node() -> Node {
        let node = Mod.Node()
        self.mod(node: node)
        return node
    }
    
    /// ビルダーで定義されたプロセスを任意のノードに対して実行します.
    func process(node: Self.Mod.Node) -> Self.Mod.Node {
        self.mod(node: node)
        return node
    }
    
    /// モディファイアをプロセスに追加します.
    func modifier<T: Modifier>(mod: T) -> Next<T> {
        T.link(from: mod, previous: self)
    }
    
}

extension Modifier {
    static func link<T: BuilderProtocol>(from mod: Self, previous: T) -> Link<T, Self> where T.Mod.Node == Self.Node {
        .init(previous: previous, modData: mod)
    }
    
}

public struct Link<Previous: BuilderProtocol, Mod: Modifier>: BuilderProtocol where Previous.Mod.Node == Mod.Node {
    var previous: Previous
    public var modData: Mod
    
    public func mod(node: Mod.Node) {
        self.previous.mod(node: node)
        self.modData.mod(node: node)
    }
    
}

public struct Empty<Node: SKNode>: Modifier {
    public func mod(node: Node) {}
    
}

/// ビルダーの起点となる構造体です.
public struct Builder<Node: SKNode>: BuilderProtocol {
    public typealias Mod = Empty<Node>
    
    public func mod(node: Node) {}
    
    public var modData: Empty<Node>
    
    public init() {
        self.modData = .init()
    }
    
}
