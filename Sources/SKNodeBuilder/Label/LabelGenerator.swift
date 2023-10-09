//
//  LabelGenerator.swift
//  
//
//  Created by rrbox on 2022/11/09.
//

import SpriteKit

public enum LabelGenerators {
    public struct FontNamed<Node: SKLabelNode>: DefaultNodeGenerator {
        let fontName: String?
        public func node() -> Node {
            Node(fontNamed: self.fontName)
        }
    }
    
    public struct Text<Node: SKLabelNode>: DefaultNodeGenerator {
        let text: String?
        public func node() -> Node {
            Node(text: text)
        }
    }
    
    public struct AttributedText<Node: SKLabelNode>: DefaultNodeGenerator {
        let attributedText: NSAttributedString?
        public func node() -> Node {
            Node(attributedText: self.attributedText)
        }
    }
    
}

public extension Generators where Node: SKLabelNode {
    static func make(fontNamed fontName: String?) -> LabelGenerators.FontNamed<Node> {
        .init(fontName: fontName)
    }
    
    static func make(text: String?) -> LabelGenerators.Text<Node> {
        .init(text: text)
    }
    
    static func make(attributedText: NSAttributedString?) -> LabelGenerators.AttributedText<Node> {
        .init(attributedText: attributedText)
    }
    
}
