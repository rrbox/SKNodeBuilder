//
//  File.swift
//  
//
//  Created by rrbox on 2022/09/09.
//

import SpriteKit

public struct Builder<T: ProcessorProtocol> {
    let processor: T
    
    public func node() -> T.Node {
        let result = T.Node()
        self.processor.mod(node: result)
        return result
    }
}
