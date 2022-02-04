import XCTest
@testable import SKNodeBuilder
import SpriteKit

final class SKNodeBuilderTests: XCTestCase {
    func testExample() throws {
        let node = SKNode()
        Builder(node)
            .position(CGPoint(x: 32, y: 32))
            .add(child: SKNode(), build: { builder in
                builder
                    .position(CGPoint(x: 32, y: 32))
                    .add(child: SKLabelNode(text: "text")) { builder in
                        builder
                            .position(CGPoint(x: 32, y: 32))
                    }
            })
            .setScale(98)
        
        XCTAssertEqual(CGPoint(x: 32, y: 32), node.position)
        XCTAssertEqual(node.children.count, 1)
    }
}
