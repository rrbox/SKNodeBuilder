//
//  File.swift
//  
//
//  Created by rrbox on 2021/11/20.
//

import SpriteKit

public typealias SpriteBuilder = Builder<SKSpriteNode>

/// name space of SKSpriteNode builder's modifiers.
public enum Sprite {
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

public extension BuilderProtocol where Node == SKSpriteNode {
    
    @discardableResult func texture(_ value: SKTexture) -> Next<Sprite.Texture> {
        self.modifier(mod: Sprite.Texture(body: value))
    }
    
    @discardableResult func size(_ value: CGSize) -> Next<Sprite.Size> {
        self.modifier(mod: Sprite.Size(body: value))
    }
    
    @discardableResult func anchorPoint(_ value: CGPoint) -> Next<Sprite.AnchorPoint> {
        self.modifier(mod: Sprite.AnchorPoint(body: value))
    }
    
    @discardableResult func centerRect(_ value: CGRect) -> Next<Sprite.CenterRect> {
        self.modifier(mod: Sprite.CenterRect(body: value))
    }
    
    @discardableResult func color(_ value: SKColor) -> Next<Sprite.Color> {
        self.modifier(mod: Sprite.Color(body: value))
    }
    
    @discardableResult func colorBlendFactor(_ value: CGFloat) -> Next<Sprite.ColorBlendFactor> {
        self.modifier(mod: Sprite.ColorBlendFactor(body: value))
    }
    
    @discardableResult func blendMode(_ value: SKBlendMode) -> Next<Sprite.BlendMode> {
        self.modifier(mod: Sprite.BlendMode(body: value))
    }
    
    @discardableResult func lightingBitMask(_ value: UInt32) -> Next<Sprite.LightingBitMask> {
        self.modifier(mod: Sprite.LightingBitMask(body: value))
    }
    
    @discardableResult func shadowedBitMask(_ value: UInt32) -> Next<Sprite.ShadowedBitMask> {
        self.modifier(mod: Sprite.ShadowedBitMask(body: value))
    }
    
    @discardableResult func shadowCastBitMask(_ value: UInt32) -> Next<Sprite.ShadowCastBitMask> {
        self.modifier(mod: Sprite.ShadowCastBitMask(body: value))
    }
    
    @discardableResult func normalTexture(_ value: SKTexture?) -> Next<Sprite.NormalTexture> {
        self.modifier(mod: Sprite.NormalTexture(body: value))
    }
    
    @discardableResult func shader(_ value: SKShader?) -> Next<Sprite.Shader> {
        self.modifier(mod: Sprite.Shader(body: value))
    }
    
    @discardableResult func setValue(_ value: SKAttributeValue, forAttribute key: String) -> Next<Sprite.SetValue> {
        self.modifier(mod: Sprite.SetValue(value: value, key: key))
    }
    
}
