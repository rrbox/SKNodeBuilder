//
//  SpriteGenerator.swift
//  
//
//  Created by rrbox on 2022/11/09.
//

import SpriteKit

public enum SpriteGenerators {
    
    public struct ImageNamed<Node: SKSpriteNode>: DefaultNodeGenerator {
        let name: String
        public func node() -> Node {
            Node(imageNamed: self.name)
        }
    }
    
    public struct ImageWithNormalMapped<Node: SKSpriteNode>: DefaultNodeGenerator {
        let name: String
        let generateNormalMap: Bool
        public func node() -> Node {
            Node(imageNamed: self.name, normalMapped: self.generateNormalMap)
        }
    }
    
    public struct Texture<Node: SKSpriteNode>: DefaultNodeGenerator {
        let texture: SKTexture?
        public func node() -> Node {
            Node(texture: self.texture)
        }
    }
    
    public struct TextureColorSize<Node: SKSpriteNode>: DefaultNodeGenerator {
        let texture: SKTexture?
        let color: SKColor
        let size: CGSize
        public func node() -> Node {
            Node(texture: self.texture, color: self.color, size: self.size)
        }
    }
    
    public struct TextureSize<Node: SKSpriteNode>: DefaultNodeGenerator {
        let texture: SKTexture?
        let size: CGSize
        public func node() -> Node {
            Node(texture: texture, size: size)
        }
    }
    
    public struct TextureNormalMap<Node: SKSpriteNode>: DefaultNodeGenerator {
        let texture: SKTexture?
        let normalMap: SKTexture?
        public func node() -> Node {
            Node(texture: self.texture, normalMap: self.normalMap)
        }
    }
    
    public struct ColorSize<Node: SKSpriteNode>: DefaultNodeGenerator {
        let color: SKColor
        let size: CGSize
        public func node() -> Node {
            Node(color: self.color, size: self.size)
        }
    }
    
}

public extension Generators where Node: SKSpriteNode {
    
    static func make(imageNamed name: String) -> SpriteGenerators.ImageNamed<Node> {
        .init(name: name)
    }
    
    static func make(imageNamed name: String, normalMapped generateNormalMap: Bool) -> SpriteGenerators.ImageWithNormalMapped<Node> {
        .init(name: name, generateNormalMap: generateNormalMap)
    }
    
    static func make(texture: SKTexture?) -> SpriteGenerators.Texture<Node> {
        .init(texture: texture)
    }
    
    static func make(texture: SKTexture?, color: SKColor, size: CGSize) -> SpriteGenerators.TextureColorSize<Node> {
        .init(texture: texture, color: color, size: size)
    }
    
    static func make(texture: SKTexture?, size: CGSize) -> SpriteGenerators.TextureSize<Node> {
        .init(texture: texture, size: size)
    }
    
    static func make(texture: SKTexture?, normalMap: SKTexture?) -> SpriteGenerators.TextureNormalMap<Node> {
        .init(texture: texture, normalMap: normalMap)
    }
    
    static func make(color: SKColor, size: CGSize) -> SpriteGenerators.ColorSize<Node> {
        .init(color: color, size: size)
    }
    
}
