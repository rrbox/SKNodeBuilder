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
        let childNode = SKNode()
        childNode.name = "sample_2"
        let childLabel = SKLabelNode(text: "sample label")
        
        let node = Builder(
            Generators.make(),
            processor: Processor<EmptyNode>()
                .position(CGPoint(x: 1, y: 0))
                .zPosition(1)
                .zRotation(1)
                .setScale(2)
                .alpha(0.5)
                .name("test_node")
                .addChild(
                    builder: .init(Generators.make(),
                                   processor: Processor()
                        .name("sample_0")
                        .position(CGPoint(x: 32, y: 32))))
                .addChild(childNode)
                .addChild(
                    Processor<SKLabelNode>()
                        .fontColor(.red),
                    withNode: childLabel))
                .node()
            
            XCTAssertEqual(node.position, CGPoint(x: 1, y: 0))
            XCTAssertEqual(node.zPosition, 1)
            XCTAssertEqual(node.zRotation, 1)
            XCTAssertEqual(node.xScale, 2)
            XCTAssertEqual(node.yScale, 2)
            XCTAssertEqual(node.alpha, 0.5)
            XCTAssertEqual(node.children.count, 3)
            XCTAssertEqual(node.childNode(withName: "sample_0")!.position, CGPoint(x: 32, y: 32))
            XCTAssertEqual(node.name, "test_node")
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
