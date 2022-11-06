//
//  NodeInit.swift
//  
//
//  Created by rrbox on 2022/09/08.
//

import SpriteKit

public protocol GeneratorProtocol {
    associatedtype Node: SKNode
}

public protocol ThrowableNodeGenerator: GeneratorProtocol {
    func node() throws -> Node
}

public protocol OptionalNodeGenerator: GeneratorProtocol {
    func node() -> Node?
}

public protocol DefaultNodeGenerator: GeneratorProtocol {
    func node() -> Node
}
