//
//  File.swift
//  
//
//  Created by rrbox on 2021/11/20.
//

import SpriteKit

public typealias SpriteBuilder = Builder<SKSpriteNode>

public extension SpriteBuilder {
    
    convenience init(imageNamed name: String) {
        self.init(.init(imageNamed: name))
    }
    
    convenience init(imageNamed name: String, normalMapped generateNormalMap: Bool) {
        self.init(.init(imageNamed: name, normalMapped: generateNormalMap))
    }
    
    convenience init(texture: SKTexture?) {
        self.init(.init(texture: texture))
    }
    
    convenience init(texture: SKTexture?, color: SKColor, size: CGSize) {
        self.init(.init(texture: texture, color: color, size: size))
    }
    
    convenience init(texture: SKTexture?, size: CGSize) {
        self.init(.init(texture: texture, size: size))
    }
    
    convenience init(texture: SKTexture?, normalMap: SKTexture?) {
        self.init(.init(texture: texture, normalMap: normalMap))
    }
    
    convenience init(color: SKColor, size: CGSize) {
        self.init(.init(color: color, size: size))
    }
    
}

public extension BuilderProtocol where Body: SKSpriteNode {
    
    @discardableResult func texture(_ texture: SKTexture?) -> Self {
        self.node.texture = texture
        return self
    }
    
    @discardableResult func size(_ size: CGSize) -> Self {
        self.node.size = size
        return self
    }
    
    @discardableResult func anchorPoint(_ anchorPoint: CGPoint) -> Self {
        self.node.anchorPoint = anchorPoint
        return self
    }
    
    @discardableResult func centerRect(_ centerRect: CGRect) -> Self {
        self.node.centerRect = centerRect
        return self
    }
    
    @discardableResult func color(_ color: SKColor) -> Self {
        self.node.color = color
        return self
    }
    
    @discardableResult func colorBlendFactor(_ colorBlendFactor: CGFloat) -> Self {
        self.node.colorBlendFactor = colorBlendFactor
        return self
    }
    
    @discardableResult func blendMode(_ blendMode: SKBlendMode) -> Self {
        self.node.blendMode = blendMode
        return self
    }
    
    @discardableResult func lightingBitMask(_ lightingBitMask: UInt32) -> Self {
        self.node.lightingBitMask = lightingBitMask
        return self
    }
    
    @discardableResult func shadowedBitMask(_ shadowedBitMask: UInt32) -> Self {
        self.node.shadowedBitMask = shadowedBitMask
        return self
    }
    
    @discardableResult func shadowCastBitMask(_ shadowCastBitMask: UInt32) -> Self {
        self.node.shadowCastBitMask = shadowCastBitMask
        return self
    }
    
    @discardableResult func normalTexture(_ normalTexture: SKTexture?) -> Self {
        self.node.normalTexture = normalTexture
        return self
    }
    
    @discardableResult func shader(_ shader: SKShader?) -> Self {
        self.node.shader = shader
        return self
    }
    
    @discardableResult func setValue(_ value: SKAttributeValue, forAttribute key: String) -> Self {
        self.node.setValue(value, forAttribute: key)
        return self
    }
    
}
