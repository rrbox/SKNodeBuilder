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

final class SubclassTets: XCTestCase {
    
    func testSubclassNode() {
        _ = Builder(
            .init(),
            processor: Processor<SpriteNode>()
        )
    }
    
}
