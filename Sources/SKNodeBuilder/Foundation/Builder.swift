//
//  Builder.swift
//  
//
//  Created by rrbox on 2022/09/09.
//

import SpriteKit

/// ビルダーの起点となる構造体です.
public struct Builder<T: ProcessorProtocol> {
    let nodeInit: NodeInit<T.Node>
    let processor: T
    
    public init(_ nodeInit: NodeInit<T.Node>, processor: T) {
        self.nodeInit = nodeInit
        self.processor = processor
    }
    
    /// 定義されたビルダーからノードを生成します.
    ///
    /// Node の型によらず, ノードの生成は `Node()` から開始されます.
    public func node() -> T.Node {
        let result = self.nodeInit.make()
        self.processor.mod(node: result)
        return result
    }
    
}
