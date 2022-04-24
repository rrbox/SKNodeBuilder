import XCTest
@testable import SKNodeBuilder
import SpriteKit

final class SKNodeBuilderTests: XCTestCase {
    func testExample() throws {
        
        let label = SKLabelNode(text: "test")
        
        let node = Builder()
            .position(CGPoint(x: 32, y: 32))
            .add(child: SKNode(), build: { builder in
                builder
                    .position(CGPoint(x: 32, y: 32))
                    .add(child: label) { builder in
                        builder
                            .position(CGPoint(x: 32, y: 32))
                    }
                    .add(
                        child: Builder<SKSpriteNode>(color: .white, size: CGSize(width: 32, height: 32))
                            .position(CGPoint(x: 100, y: 100))
                    )
            })
            .setScale(98)
            .node
        
        XCTAssertEqual(CGPoint(x: 32, y: 32), node.position)
        XCTAssertEqual(node.children.count, 1)
    }
}
