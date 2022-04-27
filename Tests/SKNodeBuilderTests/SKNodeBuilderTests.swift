import XCTest
@testable import SKNodeBuilder
import SpriteKit

final class SKNodeBuilderTests: XCTestCase {
    
    func testDefaultBuilder() throws {
        
        let node = Builder<SKNode>()
            .position(CGPoint(x: 1, y: 0))
            .zPosition(1)
            .zRotation(1)
            .setScale(2)
            .alpha(0.5)
            .name("test_node")
            .node
        
        XCTAssertEqual(node.position, CGPoint(x: 1, y: 0))
        XCTAssertEqual(node.zPosition, 1)
        XCTAssertEqual(node.zRotation, 1)
        XCTAssertEqual(node.xScale, 2)
        XCTAssertEqual(node.yScale, 2)
        XCTAssertEqual(node.alpha, 0.5)
        XCTAssertEqual(node.name, "test_node")
        
    }
    
    func testSpriteBuilder() throws {
        
        let node = Builder<SKSpriteNode>()
            .size(CGSize(width: 32, height: 32))
            .anchorPoint(CGPoint(x: 1, y: 1))
            .centerRect(CGRect(x: 0, y: 0, width: 320, height: 320))
            .colorBlendFactor(0b0001)
            .lightingBitMask(0b0010)
            .shadowedBitMask(0b0100)
            .shadowCastBitMask(0b1000)
            .node
        
        XCTAssertEqual(node.size, CGSize(width: 32, height: 32))
        XCTAssertEqual(node.anchorPoint, CGPoint(x: 1, y: 1))
        XCTAssertEqual(node.centerRect, CGRect(x: 0, y: 0, width: 320, height: 320))
        XCTAssertEqual(node.colorBlendFactor, 0b0001)
        XCTAssertEqual(node.lightingBitMask, 0b0010)
        XCTAssertEqual(node.shadowedBitMask, 0b0100)
        XCTAssertEqual(node.shadowCastBitMask, 0b1000)
        
    }
    
    func testLabelBuilder() throws {
        
        let node = Builder<SKLabelNode>()
            .text("Sample")
            .fontColor(.green)
            .fontName("Times")
            .fontSize(100)
            .vertivalAlignment(.center)
            .horizontalAlignment(.left)
            .preferredMaxLayoutWidth(100)
            .lineBreakMode(.byClipping)
            .numberOfLines(95)
            .node
        
        XCTAssertEqual(node.text, "Sample")
        XCTAssertEqual(node.fontColor, SKColor.green)
        XCTAssertEqual(node.fontName, "Times")
        XCTAssertEqual(node.fontSize, 100)
        XCTAssertEqual(node.verticalAlignmentMode, .center)
        XCTAssertEqual(node.horizontalAlignmentMode, .left)
        XCTAssertEqual(node.preferredMaxLayoutWidth, 100)
        XCTAssertEqual(node.lineBreakMode, .byClipping)
        XCTAssertEqual(node.numberOfLines, 95)
    }
    
}
