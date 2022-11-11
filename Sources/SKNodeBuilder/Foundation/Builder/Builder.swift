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
