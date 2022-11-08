//
//  SubclassTests.swift
//  
//
//  Created by rrbox on 2022/11/03.
//

import SpriteKit
import SKNodeBuilder
import XCTest

class EmptyNode: SKNode {
    
}

class SpriteNode: SKSpriteNode {
    
}

class LabelNode: SKLabelNode {
    
}

class ShapeNode: SKShapeNode {
    
}

final class SubclassTets: XCTestCase {
    
    func testSKNodeSubclass() {
        _ = Builder(
            Generators.make(),
            processor: Processor<EmptyNode>())
    }
    
    func testSpriteSubclass() {
        _ = Builder(
            Generators.make(),
            processor: Processor<SpriteNode>()
                .size(CGSize(width: 32, height: 32))
        )
    }
    
    func testLabelSubclass() {
        _ = Builder(
            Generators.make(),
            processor: Processor<LabelNode>()
                .text("test"))
    }
    
    func testShapeSubclass() {
        _ = Builder(
            Generators.make(),
            processor: Processor<ShapeNode>())
    }
    
}
