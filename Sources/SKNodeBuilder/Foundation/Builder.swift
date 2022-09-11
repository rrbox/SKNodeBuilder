//
//  File.swift
//  
//
//  Created by rrbox on 2022/09/09.
//

import SpriteKit

/// ビルダーの起点となる構造体です.
public struct Builder<T: ProcessorProtocol> {
    public typealias Next<Mod: Modifier> = Builder<Link<T, Mod>> where Mod.Node == T.Node
    
    let processor: T
    
    /// 定義されたビルダーからノードを生成します.
    ///
    /// Node の型によらず, ノードの生成は `Node()` から開始されます.
    public func node() -> T.Node {
        let result = T.Node()
        self.processor.mod(node: result)
        return result
    }
    
}
