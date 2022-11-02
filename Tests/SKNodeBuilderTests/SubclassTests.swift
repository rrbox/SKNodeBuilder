//
//  SubclassTests.swift
//  
//
//  Created by rrbox on 2022/11/02.
//

import SpriteKit
import SKNodeBuilder
import XCTest

class SpriteNode: SKSpriteNode {
    
}

class LabelNode: SKLabelNode {
    
}

class ShapeNode: SKShapeNode {
    
}

final class SubclassTests: XCTestCase {
    func testSubclass() {
        _ = Builder<SpriteNode>()
            .size(CGSize(width: 32, height: 32))
        
        _ = Builder<ShapeNode>()
            .fillColor(.red)
        
        _ = Builder<LabelNode>()
            .text("test")
    }
    
}
