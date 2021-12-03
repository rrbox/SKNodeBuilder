//
//  File.swift
//  
//
//  Created by rrbox on 2021/11/20.
//

import SpriteKit

public typealias SpriteBuilder = Builder<SKSpriteNode>
/// 後方互換をサポートするための型参照です.
/// - attention: v2 以降から非推奨となります.
public typealias SpriteNode = SpriteBuilder
public extension SpriteBuilder {
    @discardableResult func texture(_ texture: SKTexture?) -> Self {
        self.body.texture = texture
        return self
    }
    @discardableResult func size(_ size: CGSize) -> Self {
        self.body.size = size
        return self
    }
    @discardableResult func anchorPoint(_ anchorPoint: CGPoint) -> Self {
        self.body.anchorPoint = anchorPoint
        return self
    }
    @discardableResult func centerRect(_ centerRect: CGRect) -> Self {
        self.body.centerRect = centerRect
        return self
    }
    @discardableResult func color(_ color: SKColor) -> Self {
        self.body.color = color
        return self
    }
    @discardableResult func colorBlendFactor(_ colorBlendFactor: CGFloat) -> Self {
        self.body.colorBlendFactor = colorBlendFactor
        return self
    }
    @discardableResult func blendMode(_ blendMode: SKBlendMode) -> Self {
        self.body.blendMode = blendMode
        return self
    }
    @discardableResult func lightingBitMask(_ lightingBitMask: UInt32) -> Self {
        self.body.lightingBitMask = lightingBitMask
        return self
    }
    @discardableResult func shadowedBitMask(_ shadowedBitMask: UInt32) -> Self {
        self.body.shadowedBitMask = shadowedBitMask
        return self
    }
    @discardableResult func shadowCastBitMask(_ shadowCastBitMask: UInt32) -> Self {
        self.body.shadowCastBitMask = shadowCastBitMask
        return self
    }
    @discardableResult func normalTexture(_ normalTexture: SKTexture?) -> Self {
        self.body.normalTexture = normalTexture
        return self
    }
    @discardableResult func shader(_ shader: SKShader?) -> Self {
        self.body.shader = shader
        return self
    }
    @discardableResult func setValue(_ value: SKAttributeValue, forAttribute key: String) -> Self {
        self.body.setValue(value, forAttribute: key)
        return self
    }
}
