//
//  SKNodeGenerator.swift
//  
//
//  Created by rrbox on 2022/11/06.
//

import SpriteKit

public enum SKNodeGenerators {
    public struct Filenamed<Node: SKNode>: OptionalNodeGenerator {
        var fimeName: String
        public func node() -> Node? {
            Node(fileNamed: self.fimeName)
        }
    }
    
    public struct Coder<Node: SKNode>: OptionalNodeGenerator {
        let aDecoder: NSCoder
        public func node() -> Node? {
            Node(coder: self.aDecoder)
        }
    }
    
    public struct Empty<Node: SKNode>: DefaultNodeGenerator {
        public func node() -> Node {
            Node()
        }
    }
    
    public struct SecurelyWithClasses<Node: SKNode>: ThrowableNodeGenerator {
        let fileName: String
        let classes: Set<AnyHashable>
        
        public func node() throws -> Node {
            try Node(fileNamed: self.fileName, securelyWithClasses: self.classes)
        }
    }
    
}

public extension Generators {
    static func make(fileNamed fimeName: String) -> SKNodeGenerators.Filenamed<Node> {
        SKNodeGenerators.Filenamed<Node>(fimeName: fimeName)
    }
    
    static func make(coder aDecoder: NSCoder) -> SKNodeGenerators.Coder<Node> {
        SKNodeGenerators.Coder<Node>(aDecoder: aDecoder)
    }
    
    static func make() -> SKNodeGenerators.Empty<Node> {
        SKNodeGenerators.Empty<Node>()
    }
    
    static func make(fileNamed filename: String, securelyWithClasses classes: Set<AnyHashable>) -> SKNodeGenerators.SecurelyWithClasses<Node> {
        SKNodeGenerators.SecurelyWithClasses(fileName: filename, classes: classes)
    }
    
}
