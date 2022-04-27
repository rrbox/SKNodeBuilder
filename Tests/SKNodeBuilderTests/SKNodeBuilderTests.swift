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
}
