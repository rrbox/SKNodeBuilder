//
//  File.swift
//  
//
//  Created by rrbox on 2022/04/24.
//

import SpriteKit

public typealias ShapeBuilder = Builder<SKShapeNode>

public extension ShapeBuilder {
    
    convenience init(path: CGPath) {
        self.init(.init(path: path))
    }
    
    convenience init(path: CGPath, centered: Bool) {
        self.init(.init(path: path, centered: centered))
    }
    
    convenience init(rect: CGRect) {
        self.init(.init(rect: rect))
    }
    
    convenience init(rectOf size: CGSize) {
        self.init(.init(rectOf: size))
    }
    
    convenience init(rect: CGRect, cornerRadius: CGFloat) {
        self.init(.init(rect: rect, cornerRadius: cornerRadius))
    }
    
    convenience init(rectOf size: CGSize, cornerRadius: CGFloat) {
        self.init(.init(rectOf: size, cornerRadius: cornerRadius))
    }
    
    convenience init(circleOfRadius radius: CGFloat) {
        self.init(.init(circleOfRadius: radius))
    }
    
    convenience init(ellipseOf size: CGSize) {
        self.init(.init(ellipseOf: size))
    }
    
    convenience init(ellipseIn rect: CGRect) {
        self.init(.init(ellipseIn: rect))
    }
    
    convenience init(points: UnsafeMutablePointer<CGPoint>, count numPoints: Int) {
        self.init(.init(points: points, count: numPoints))
    }
    
    convenience init(splinePoints points: UnsafeMutablePointer<CGPoint>, count numPoints: Int) {
        self.init(.init(splinePoints: points, count: numPoints))
    }
    
}

public extension BuilderProtocol where Body == SKShapeNode {
    
    func path(_ value: CGPath) -> Self {
        self.node.path = value
        return self
    }
    
    func fillColor(_ value: SKColor) -> Self {
        self.node.fillColor = value
        return self
    }
    
    func fillTexture(_ value: SKTexture) -> Self {
        self.node.fillTexture = value
        return self
    }
    
    func lineWidth(_ value: CGFloat) -> Self {
        self.node.lineWidth = value
        return self
    }
    
    func strokeColor(_ value: SKColor) -> Self {
        self.node.strokeColor = value
        return self
    }
    
    func strokeTexture(_ value: SKTexture?) -> Self {
        self.node.strokeTexture = value
        return self
    }
    
    func glowWidth(_ value: CGFloat) -> Self {
        self.node.glowWidth = value
        return self
    }
    
    func lineCap(_ value: CGLineCap) -> Self {
        self.node.lineCap = value
        return self
    }
    
    func lineJoin(_ value: CGLineJoin) -> Self {
        self.node.lineJoin = value
        return self
    }
    
    func miterLimit(_ value: CGFloat) -> Self {
        self.node.miterLimit = value
        return self
    }
    
    func isAntialiased(_ value: Bool) -> Self {
        self.node.isAntialiased = value
        return self
    }
    
    func blendMode(_ value: SKBlendMode) -> Self {
        self.node.blendMode = value
        return self
    }
    
    func strokeShader(_ value: SKShader?) -> Self {
        self.node.strokeShader = value
        return self
    }
    
    func fillShader(_ value: SKShader?) -> Self {
        self.node.fillShader = value
        return self
    }
    
    func attributeValues(_ value: [String: SKAttributeValue]) -> Self {
        self.node.attributeValues = value
        return self
    }
    
}
