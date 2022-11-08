//
//  SpriteProcessor.swift
//  
//
//  Created by rrbox on 2021/11/20.
//

import SpriteKit

public typealias SpriteProcessor<Node: SKSpriteNode> = Processor<Node>

/// Name space of SKSpriteNode builder's modifiers.
public enum SpriteModifiers {
    
    public struct Texture<Node: SKSpriteNode>: Modifier {
        
        var body: SKTexture
        
        public func mod(node: Node) {
            node.texture = self.body
        }
        
    }
    
    public struct Size<Node: SKSpriteNode>: Modifier {
        
        var body: CGSize
        
        public func mod(node: Node) {
            node.size = self.body
        }
        
    }
    
    public struct AnchorPoint<Node: SKSpriteNode>: Modifier {
        
        var body: CGPoint
        
        public func mod(node: Node) {
            node.anchorPoint = self.body
        }
        
    }
    
    public struct CenterRect<Node: SKSpriteNode>: Modifier {
        
        var body: CGRect
        
        public func mod(node: Node) {
            node.centerRect = self.body
        }
        
    }
    
    public struct Color<Node: SKSpriteNode>: Modifier {
        
        var body: SKColor
        
        public func mod(node: Node) {
            node.color = self.body
        }
        
    }
    
    public struct ColorBlendFactor<Node: SKSpriteNode>: Modifier {
        
        var body: CGFloat
        
        public func mod(node: Node) {
            node.colorBlendFactor = self.body
        }
        
    }

    public struct BlendMode<Node: SKSpriteNode>: Modifier {
        
        var body: SKBlendMode
        
        public func mod(node: Node) {
            node.blendMode = self.body
        }
        
    }

    public struct LightingBitMask<Node: SKSpriteNode>: Modifier {
        
        var body: UInt32
        
        public func mod(node: Node) {
            node.lightingBitMask = self.body
        }
        
    }

    public struct ShadowedBitMask<Node: SKSpriteNode>: Modifier {
        
        var body: UInt32
        
        public func mod(node: Node) {
            node.shadowedBitMask = self.body
        }
        
    }
    
    public struct ShadowCastBitMask<Node: SKSpriteNode>: Modifier {
        
        var body: UInt32
        
        public func mod(node: Node) {
            node.shadowCastBitMask = self.body
        }
        
    }

    public struct NormalTexture<Node: SKSpriteNode>: Modifier {
        
        var body: SKTexture?
        
        public func mod(node: Node) {
            node.normalTexture = self.body
        }
        
    }

    public struct Shader<Node: SKSpriteNode>: Modifier {
        
        var body: SKShader?
        
        public func mod(node: Node) {
            node.shader = self.body
        }
        
    }
    
    public struct SetValue<Node: SKSpriteNode>: Modifier {
        
        var value: SKAttributeValue
        var key: String
        
        public func mod(node: Node) {
            node.setValue(self.value, forAttribute: self.key)
        }
        
    }
    
}

public extension ProcessorProtocol where Node: SKSpriteNode {
    
    func texture(_ value: SKTexture) -> Next<SpriteModifiers.Texture<Node>> {
        self.modifier(mod: SpriteModifiers.Texture(body: value))
    }
    
    func size(_ value: CGSize) -> Next<SpriteModifiers.Size<Node>> {
        self.modifier(mod: SpriteModifiers.Size(body: value))
    }
    
    func anchorPoint(_ value: CGPoint) -> Next<SpriteModifiers.AnchorPoint<Node>> {
        self.modifier(mod: SpriteModifiers.AnchorPoint(body: value))
    }
    
    func centerRect(_ value: CGRect) -> Next<SpriteModifiers.CenterRect<Node>> {
        self.modifier(mod: SpriteModifiers.CenterRect(body: value))
    }
    
    func color(_ value: SKColor) -> Next<SpriteModifiers.Color<Node>> {
        self.modifier(mod: SpriteModifiers.Color(body: value))
    }
    
    func colorBlendFactor(_ value: CGFloat) -> Next<SpriteModifiers.ColorBlendFactor<Node>> {
        self.modifier(mod: SpriteModifiers.ColorBlendFactor(body: value))
    }
    
    func blendMode(_ value: SKBlendMode) -> Next<SpriteModifiers.BlendMode<Node>> {
        self.modifier(mod: SpriteModifiers.BlendMode(body: value))
    }
    
    func lightingBitMask(_ value: UInt32) -> Next<SpriteModifiers.LightingBitMask<Node>> {
        self.modifier(mod: SpriteModifiers.LightingBitMask(body: value))
    }
    
    func shadowedBitMask(_ value: UInt32) -> Next<SpriteModifiers.ShadowedBitMask<Node>> {
        self.modifier(mod: SpriteModifiers.ShadowedBitMask(body: value))
    }
    
    func shadowCastBitMask(_ value: UInt32) -> Next<SpriteModifiers.ShadowCastBitMask<Node>> {
        self.modifier(mod: SpriteModifiers.ShadowCastBitMask(body: value))
    }
    
    func normalTexture(_ value: SKTexture?) -> Next<SpriteModifiers.NormalTexture<Node>> {
        self.modifier(mod: SpriteModifiers.NormalTexture(body: value))
    }
    
    func shader(_ value: SKShader?) -> Next<SpriteModifiers.Shader<Node>> {
        self.modifier(mod: SpriteModifiers.Shader(body: value))
    }
    
    func setValue(_ value: SKAttributeValue, forAttribute key: String) -> Next<SpriteModifiers.SetValue<Node>> {
        self.modifier(mod: SpriteModifiers.SetValue(value: value, key: key))
    }
    
}
