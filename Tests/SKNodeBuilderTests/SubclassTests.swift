//
//  SubclassTests.swift
//  
//
//  Created by rrbox on 2022/11/03.
//

import SpriteKit
import SKNodeBuilder
import XCTest

class SpriteNode: SKSpriteNode {
    
}

class LabelNode: SKLabelNode {
    
}

final class SubclassTets: XCTestCase {
    
    func testSubclassNode() {
        _ = Builder(
            Generators.make(),
            processor: Processor<SpriteNode>()
                .size(CGSize(width: 32, height: 32))
        )
        
        _ = Builder(
            Generators.make(),
            processor: Processor<LabelNode>()
                .text("test"))
    }
    
}
