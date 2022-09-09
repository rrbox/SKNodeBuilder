//
//  File.swift
//  
//
//  Created by rrbox on 2021/11/20.
//

import SpriteKit

public typealias SpriteBuilder = Builder<SKSpriteNode>

/// Name space of SKSpriteNode builder's modifiers.
public enum SpriteModifiers {
    public struct Texture: Modifier {
        var body: SKTexture
        
        public func mod(node: SKSpriteNode) {
            node.texture = self.body
        }
    }
    
    public struct Size: Modifier {
        var body: CGSize
        
        public func mod(node: SKSpriteNode) {
            node.size = self.body
        }
    }
    
    public struct AnchorPoint: Modifier {
        var body: CGPoint
        
        public func mod(node: SKSpriteNode) {
            node.anchorPoint = self.body
        }
    }
    
    public struct CenterRect: Modifier {
        var body: CGRect
        
        public func mod(node: SKSpriteNode) {
            node.centerRect = self.body
        }
    }
    
    public struct Color: Modifier {
        var body: SKColor
        
        public func mod(node: SKSpriteNode) {
            node.color = self.body
        }
    }
    
    public struct ColorBlendFactor: Modifier {
        var body: CGFloat
        
        public func mod(node: SKSpriteNode) {
            node.colorBlendFactor = self.body
        }
    }

    public struct BlendMode: Modifier {
        var body: SKBlendMode
        
        public func mod(node: SKSpriteNode) {
            node.blendMode = self.body
        }
    }

    public struct LightingBitMask: Modifier {
        var body: UInt32
        
        public func mod(node: SKSpriteNode) {
            node.lightingBitMask = self.body
        }
    }

    public struct ShadowedBitMask: Modifier {
        var body: UInt32
        
        public func mod(node: SKSpriteNode) {
            node.shadowedBitMask = self.body
        }
    }
    
    public struct ShadowCastBitMask: Modifier {
        var body: UInt32
        
        public func mod(node: SKSpriteNode) {
            node.shadowCastBitMask = self.body
        }
    }

    public struct NormalTexture: Modifier {
        var body: SKTexture?
        
        public func mod(node: SKSpriteNode) {
            node.normalTexture = self.body
        }
    }

    public struct Shader: Modifier {
        var body: SKShader?
        
        public func mod(node: SKSpriteNode) {
            node.shader = self.body
        }
    }
    
    public struct SetValue: Modifier {
        var value: SKAttributeValue
        var key: String
        
        public func mod(node: SKSpriteNode) {
            node.setValue(self.value, forAttribute: self.key)
        }
    }


    
}

public extension ProcessorProtocol where Node == SKSpriteNode {
    @discardableResult func texture(_ value: SKTexture) -> Next<SpriteModifiers.Texture> {
        self.modifier(mod: SpriteModifiers.Texture(body: value))
    }
    
    @discardableResult func size(_ value: CGSize) -> Next<SpriteModifiers.Size> {
        self.modifier(mod: SpriteModifiers.Size(body: value))
    }
    
    @discardableResult func anchorPoint(_ value: CGPoint) -> Next<SpriteModifiers.AnchorPoint> {
        self.modifier(mod: SpriteModifiers.AnchorPoint(body: value))
    }
    
    @discardableResult func centerRect(_ value: CGRect) -> Next<SpriteModifiers.CenterRect> {
        self.modifier(mod: SpriteModifiers.CenterRect(body: value))
    }
    
    @discardableResult func color(_ value: SKColor) -> Next<SpriteModifiers.Color> {
        self.modifier(mod: SpriteModifiers.Color(body: value))
    }
    
    @discardableResult func colorBlendFactor(_ value: CGFloat) -> Next<SpriteModifiers.ColorBlendFactor> {
        self.modifier(mod: SpriteModifiers.ColorBlendFactor(body: value))
    }
    
    @discardableResult func blendMode(_ value: SKBlendMode) -> Next<SpriteModifiers.BlendMode> {
        self.modifier(mod: SpriteModifiers.BlendMode(body: value))
    }
    
    @discardableResult func lightingBitMask(_ value: UInt32) -> Next<SpriteModifiers.LightingBitMask> {
        self.modifier(mod: SpriteModifiers.LightingBitMask(body: value))
    }
    
    @discardableResult func shadowedBitMask(_ value: UInt32) -> Next<SpriteModifiers.ShadowedBitMask> {
        self.modifier(mod: SpriteModifiers.ShadowedBitMask(body: value))
    }
    
    @discardableResult func shadowCastBitMask(_ value: UInt32) -> Next<SpriteModifiers.ShadowCastBitMask> {
        self.modifier(mod: SpriteModifiers.ShadowCastBitMask(body: value))
    }
    
    @discardableResult func normalTexture(_ value: SKTexture?) -> Next<SpriteModifiers.NormalTexture> {
        self.modifier(mod: SpriteModifiers.NormalTexture(body: value))
    }
    
    @discardableResult func shader(_ value: SKShader?) -> Next<SpriteModifiers.Shader> {
        self.modifier(mod: SpriteModifiers.Shader(body: value))
    }
    
    @discardableResult func setValue(_ value: SKAttributeValue, forAttribute key: String) -> Next<SpriteModifiers.SetValue> {
        self.modifier(mod: SpriteModifiers.SetValue(value: value, key: key))
    }
    
}
