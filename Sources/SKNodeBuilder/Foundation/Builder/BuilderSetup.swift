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
