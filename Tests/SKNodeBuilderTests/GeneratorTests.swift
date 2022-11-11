//
//  GeneratorTests.swift
//  
//
//  Created by rrbox on 2022/11/11.
//

import SpriteKit
import SKNodeBuilder
import XCTest

final class GeneratorTests: XCTestCase {
    func testSKNodeGenerator() {
        var node = Generators.make(fileNamed: "sample").node()
        XCTAssertNil(node)
        
        node = Generators.make().node()
        XCTAssertNotNil(node)
    }
    
    func testSKSpriteNodeGenerator() {
        let node = Generators<SKSpriteNode>.make(color: .red, size: CGSize(width: 32, height: 32)).node()
        XCTAssertEqual(NSColor.red.cgColor.components, node.color.cgColor.components)
        XCTAssertEqual(node.size, CGSize(width: 32, height: 32))
        
    }
    
    func testSKLabelNodeGenerator() {
        var node = Generators<SKLabelNode>.make(text: "test_0").node()
        XCTAssertEqual(node.text, "test_0")
        
        node = Generators<SKLabelNode>.make(fontNamed: "times").node()
        XCTAssertEqual(node.fontName, "times")
        
        node = Generators<SKLabelNode>.make(attributedText: NSAttributedString(string: "test_1")).node()
        XCTAssertEqual(node.attributedText, NSAttributedString(string: "test_1"))
    }
    
    func testSKShapeNodeGenerator() {
        var node = Generators<SKShapeNode>.make().node()
        XCTAssertNil(node.path)
        
        node = Generators<SKShapeNode>.make(path: .init(rect: CGRect(x: 0, y: 0, width: 10, height: 10), transform: nil)).node()
        XCTAssertEqual(node.path!.boundingBox, CGRect(x: 0, y: 0, width: 10, height: 10))
        
        node = Generators<SKShapeNode>.make(rectOf: CGSize(width: 32, height: 32)).node()
        XCTAssertEqual(node.path!.boundingBox, CGRect(x: -16, y: -16, width: 32, height: 32))
    }
}
