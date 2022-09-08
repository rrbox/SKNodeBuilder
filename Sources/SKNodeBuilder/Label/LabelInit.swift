//
//  File.swift
//  
//
//  Created by rrbox on 2022/09/08.
//

import Foundation
import SpriteKit

enum Label: NodeInitType {
    typealias Node = SKLabelNode
    
    
}

struct LabelInit: NodeMake {
    let params: Label
    
    func make() -> SKLabelNode {
        .init()
    }
    
    typealias InitType = Label
    
}
