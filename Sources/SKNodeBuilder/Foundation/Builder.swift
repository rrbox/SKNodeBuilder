//
//  Builder.swift
//  
//
//  Created by rrbox on 2022/09/09.
//

import SpriteKit

/// ビルダーの起点となる構造体です.
public struct Builder<Generator: GeneratorProtocol, T: ProcessorProtocol> where Generator.Node == T.Mod.Node {
    
    let generator: Generator
    let processor: T
    
    public init(_ generator: Generator, processor: T) {
        self.generator = generator
        self.processor = processor
    }
    
}

public extension Builder where Generator: OptionalNodeGenerator {
    func node() -> Generator.Node? {
        guard let result = self.generator.node() else {
            return nil
        }
        return self.processor.process(node: result)
    }
    
}

public extension Builder where Generator: ThrowableNodeGenerator {
    func node() throws -> Generator.Node {
        return self.processor.process(node: try self.generator.node())
    }
    
}

public extension Builder where Generator: DefaultNodeGenerator {
    /// 定義されたビルダーからノードを生成します.
    ///
    /// Node の型によらず, ノードの生成は `Node()` から開始されます.
    func node() -> Generator.Node {
        return self.processor.process(node: self.generator.node())
    }
    
}
