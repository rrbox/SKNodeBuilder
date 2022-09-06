//
//  File.swift
//  
//
//  Created by rrbox on 2022/04/24.
//

import SpriteKit

public typealias ShapeBuilder = Builder<SKShapeNode>

/// name space of SKShapeNode builder's modifiers.
public enum Shape {
    public struct Path: Modifier {
        var body: CGPath?
        
        public func mod(node: SKShapeNode) {
            node.path = self.body
        }
    }
    
    public struct FillColor: Modifier {
        var body: SKColor
        
        public func mod(node: SKShapeNode) {
            node.fillColor = self.body
        }
    }
    
    public struct FillTexture: Modifier {
        var body: SKTexture?
        
        public func mod(node: SKShapeNode) {
            node.fillTexture = self.body
        }
    }

    public struct LineWidth: Modifier {
        var body: CGFloat
        
        public func mod(node: SKShapeNode) {
            node.lineWidth = self.body
        }
    }
    
    public struct StrokeColor: Modifier {
        var body: SKColor
        
        public func mod(node: SKShapeNode) {
            node.strokeColor = self.body
        }
    }

    public struct StrokeTexture: Modifier {
        var body: SKTexture?
        
        public func mod(node: SKShapeNode) {
            node.strokeTexture = self.body
        }
    }

    public struct GlowWidth: Modifier {
        var body: CGFloat
        
        public func mod(node: SKShapeNode) {
            node.glowWidth = self.body
        }
    }

    public struct LineCap: Modifier {
        var body: CGLineCap
        
        public func mod(node: SKShapeNode) {
            node.lineCap = self.body
        }
    }

    public struct LineJoin: Modifier {
        var body: CGLineJoin
        
        public func mod(node: SKShapeNode) {
            node.lineJoin = self.body
        }
    }

    public struct MiterLimit: Modifier {
        var body: CGFloat
        
        public func mod(node: SKShapeNode) {
            node.miterLimit = self.body
        }
    }
    
    public struct IsAntialiased: Modifier {
        var body: Bool
        
        public func mod(node: SKShapeNode) {
            node.isAntialiased = self.body
        }
    }

    public struct BlendMode: Modifier {
        var body: SKBlendMode
        
        public func mod(node: SKShapeNode) {
            node.blendMode = self.body
        }
    }
    
    public struct StrokeShader: Modifier {
        var body: SKShader?
        
        public func mod(node: SKShapeNode) {
            node.strokeShader = self.body
        }
    }

    public struct FillShader: Modifier {
        var body: SKShader?
        
        public func mod(node: SKShapeNode) {
            node.fillShader = self.body
        }
    }
    
    public struct AttributeValues: Modifier {
        var body: [String: SKAttributeValue]
        
        public func mod(node: SKShapeNode) {
            node.attributeValues = self.body
        }
    }



}

public extension BuilderProtocol where Node == SKShapeNode {
    
    @discardableResult func path(_ value: CGPath?) -> Next<Shape.Path> {
        self.modifier(mod: Shape.Path(body: value))
    }
    
    @discardableResult func fillColor(_ value: SKColor) -> Next<Shape.FillColor> {
        self.modifier(mod: Shape.FillColor(body: value))
    }
    
    @discardableResult func fillTexture(_ value: SKTexture?) -> Next<Shape.FillTexture> {
        self.modifier(mod: Shape.FillTexture(body: value))
    }
    
    @discardableResult func lineWidth(_ value: CGFloat) -> Next<Shape.LineWidth> {
        self.modifier(mod: Shape.LineWidth(body: value))
    }
    
    @discardableResult func strokeColor(_ value: SKColor) -> Next<Shape.StrokeColor> {
        self.modifier(mod: Shape.StrokeColor(body: value))
    }
    
    @discardableResult func strokeTexture(_ value: SKTexture?) -> Next<Shape.StrokeTexture> {
        self.modifier(mod: Shape.StrokeTexture(body: value))
    }
    
    @discardableResult func glowWidth(_ value: CGFloat) -> Next<Shape.GlowWidth> {
        self.modifier(mod: Shape.GlowWidth(body: value))
    }
    
    @discardableResult func lineCap(_ value: CGLineCap) -> Next<Shape.LineCap> {
        self.modifier(mod: Shape.LineCap(body: value))
    }
    
    @discardableResult func lineJoin(_ value: CGLineJoin) -> Next<Shape.LineJoin> {
        self.modifier(mod: Shape.LineJoin(body: value))
    }
    
    @discardableResult func miterLimit(_ value: CGFloat) -> Next<Shape.MiterLimit> {
        self.modifier(mod: Shape.MiterLimit(body: value))
    }
    
    @discardableResult func isAntialiased(_ value: Bool) -> Next<Shape.IsAntialiased> {
        self.modifier(mod: Shape.IsAntialiased(body: value))
    }
    
    @discardableResult func blendMode(_ value: SKBlendMode) -> Next<Shape.BlendMode> {
        self.modifier(mod: Shape.BlendMode(body: value))
    }
    
    @discardableResult func strokeShader(_ value: SKShader?) -> Next<Shape.StrokeShader> {
        self.modifier(mod: Shape.StrokeShader(body: value))
    }
    
    @discardableResult func fillShader(_ value: SKShader?) -> Next<Shape.FillShader> {
        self.modifier(mod: Shape.FillShader(body: value))
    }
    
    @discardableResult func attributeValues(_ value: [String: SKAttributeValue]) -> Next<Shape.AttributeValues> {
        self.modifier(mod: Shape.AttributeValues(body: value))
    }
    
}
