//
//  BuilderSetup.swift
//  
//
//  Created by rrbox on 2022/11/09.
//

import SpriteKit

public struct Blank<Node: SKNode>: GeneratorProtocol, ProcessorProtocol {
    public typealias Mod = Empty<Node>
    public var modData: Empty<Node>
    
    public func mod(node: Node) {}
    
}

public extension Builder {
    init<Node: SKNode>(nodeType: Node.Type) where Generator == Blank<Node>, T == Blank<Node> {
        self.processor = Blank<Node>(modData: .init())
        self.generator = Blank<Node>(modData: .init())
    }
}

public extension Builder where Generator == Blank<T.Node> {
    
    func setGenerator<U: GeneratorProtocol>(_ generator: U) -> Builder<U, T> {
        .init(generator, processor: self.processor)
    }
    
}

public extension Builder where T == Blank<Generator.Node> {
    
    func setProcessor<U: ProcessorProtocol>(_ processor: U) -> Builder<Generator, U> {
        .init(self.generator, processor: processor)
    }
    
}
