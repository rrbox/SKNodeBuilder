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
        let node = Builder(
            Generators.make(),
            processor: Processor<SpriteNode>()
                .size(CGSize(width: 32, height: 32))
                .anchorPoint(CGPoint(x: 1, y: 1))
                .centerRect(CGRect(x: 0, y: 0, width: 320, height: 320))
                .colorBlendFactor(0b0001)
                .lightingBitMask(0b0010)
                .shadowedBitMask(0b0100)
                .shadowCastBitMask(0b1000)
                .color(.green))
                .node()
            
            XCTAssertEqual(node.size, CGSize(width: 32, height: 32))
            XCTAssertEqual(node.anchorPoint, CGPoint(x: 1, y: 1))
            XCTAssertEqual(node.centerRect, CGRect(x: 0, y: 0, width: 320, height: 320))
            XCTAssertEqual(node.colorBlendFactor, 0b0001)
            XCTAssertEqual(node.lightingBitMask, 0b0010)
            XCTAssertEqual(node.shadowedBitMask, 0b0100)
            XCTAssertEqual(node.shadowCastBitMask, 0b1000)
    #if os(iOS)
            XCTAssertEqual(node.color, .green)
    #endif
        
    }
    
    func testLabelSubclass() {
        let node = Builder(
            Generators.make(),
            processor: Processor<LabelNode>()
                .text("Sample")
                .fontColor(.green)
                .fontName("Times")
                .fontSize(100)
                .verticalAlignment(.center)
                .horizontalAlignment(.left)
                .preferredMaxLayoutWidth(100)
                .lineBreakMode(.byClipping)
                .numberOfLines(95)
                .color(.green))
                .node()
            
            XCTAssertEqual(node.text, "Sample")
            XCTAssertEqual(node.fontColor, SKColor.green)
            XCTAssertEqual(node.fontName, "Times")
            XCTAssertEqual(node.fontSize, 100)
            XCTAssertEqual(node.verticalAlignmentMode, .center)
            XCTAssertEqual(node.horizontalAlignmentMode, .left)
            XCTAssertEqual(node.preferredMaxLayoutWidth, 100)
            XCTAssertEqual(node.lineBreakMode, .byClipping)
            XCTAssertEqual(node.numberOfLines, 95)
    #if os(iOS)
            XCTAssertEqual(node.color, .green)
    #endif
        
    }
    
    func testShapeSubclass() {
        let node = Builder(
            Generators.make(),
            processor: Processor<ShapeNode>()
                .path(CGPath(rect: CGRect(x: 0, y: 0, width: 32, height: 32), transform: nil))
                .fillColor(.red)
                .lineWidth(1)
                .strokeColor(.green)
                .glowWidth(2)
                .lineCap(.round)
                .lineJoin(.round)
                .miterLimit(3)
                .isAntialiased(false)
                .blendMode(.add))
                .node()
            
            XCTAssertEqual(node.path, CGPath(rect: CGRect(x: 0, y: 0, width: 32, height: 32), transform: nil))
            XCTAssertEqual(node.fillColor, .red)
            XCTAssertEqual(node.lineWidth, 1)
            XCTAssertEqual(node.strokeColor, .green)
            XCTAssertEqual(node.glowWidth, 2)
            XCTAssertEqual(node.lineCap, .round)
            XCTAssertEqual(node.lineJoin, .round)
            XCTAssertEqual(node.miterLimit, 3)
            XCTAssertEqual(node.isAntialiased, false)
            XCTAssertEqual(node.blendMode, .add)
    }
    
}
