import XCTest
@testable import SKNodeBuilder
import SpriteKit

final class SKNodeBuilderTests: XCTestCase {
    func testExample() throws {
        let node = SKNode()
        Builder(node)
            .position(CGPoint(x: 32, y: 32))
            .addChild(Builder(SKNode()))
        XCTAssertEqual(CGPoint(x: 32, y: 32), node.position)
        XCTAssertEqual(node.children.count, 1)
    }
}
