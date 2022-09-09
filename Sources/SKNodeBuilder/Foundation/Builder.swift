//
//  File.swift
//  
//
//  Created by rrbox on 2022/09/09.
//

import SpriteKit

public struct Builder<T: ProcessorProtocol> {
    public typealias Next<Mod: Modifier> = Builder<Link<T, Mod>> where Mod.Node == T.Node
    
    let processor: T
    
    public func node() -> T.Node {
        let result = T.Node()
        self.processor.mod(node: result)
        return result
    }
    
    public func modifier<Mod: Modifier>(_ mod: Mod) -> Next<Mod> {
        Next<Mod>.init(processor: .init(previous: self.processor, modData: mod))
    }
}
