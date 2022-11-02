//
//  ShapeProcessor.swift
//  
//
//  Created by rrbox on 2022/04/24.
//

import SpriteKit

public typealias ShapeProcessor<Node: SKShapeNode> = Processor<Node>

/// Name space of SKShapeNode builder's modifiers.
public enum ShapeModifiers {
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

public extension ProcessorProtocol where Node == SKShapeNode {
    @discardableResult func path(_ value: CGPath?) -> Next<ShapeModifiers.Path> {
        self.modifier(mod: ShapeModifiers.Path(body: value))
    }
    
    @discardableResult func fillColor(_ value: SKColor) -> Next<ShapeModifiers.FillColor> {
        self.modifier(mod: ShapeModifiers.FillColor(body: value))
    }
    
    @discardableResult func fillTexture(_ value: SKTexture?) -> Next<ShapeModifiers.FillTexture> {
        self.modifier(mod: ShapeModifiers.FillTexture(body: value))
    }
    
    @discardableResult func lineWidth(_ value: CGFloat) -> Next<ShapeModifiers.LineWidth> {
        self.modifier(mod: ShapeModifiers.LineWidth(body: value))
    }
    
    @discardableResult func strokeColor(_ value: SKColor) -> Next<ShapeModifiers.StrokeColor> {
        self.modifier(mod: ShapeModifiers.StrokeColor(body: value))
    }
    
    @discardableResult func strokeTexture(_ value: SKTexture?) -> Next<ShapeModifiers.StrokeTexture> {
        self.modifier(mod: ShapeModifiers.StrokeTexture(body: value))
    }
    
    @discardableResult func glowWidth(_ value: CGFloat) -> Next<ShapeModifiers.GlowWidth> {
        self.modifier(mod: ShapeModifiers.GlowWidth(body: value))
    }
    
    @discardableResult func lineCap(_ value: CGLineCap) -> Next<ShapeModifiers.LineCap> {
        self.modifier(mod: ShapeModifiers.LineCap(body: value))
    }
    
    @discardableResult func lineJoin(_ value: CGLineJoin) -> Next<ShapeModifiers.LineJoin> {
        self.modifier(mod: ShapeModifiers.LineJoin(body: value))
    }
    
    @discardableResult func miterLimit(_ value: CGFloat) -> Next<ShapeModifiers.MiterLimit> {
        self.modifier(mod: ShapeModifiers.MiterLimit(body: value))
    }
    
    @discardableResult func isAntialiased(_ value: Bool) -> Next<ShapeModifiers.IsAntialiased> {
        self.modifier(mod: ShapeModifiers.IsAntialiased(body: value))
    }
    
    @discardableResult func blendMode(_ value: SKBlendMode) -> Next<ShapeModifiers.BlendMode> {
        self.modifier(mod: ShapeModifiers.BlendMode(body: value))
    }
    
    @discardableResult func strokeShader(_ value: SKShader?) -> Next<ShapeModifiers.StrokeShader> {
        self.modifier(mod: ShapeModifiers.StrokeShader(body: value))
    }
    
    @discardableResult func fillShader(_ value: SKShader?) -> Next<ShapeModifiers.FillShader> {
        self.modifier(mod: ShapeModifiers.FillShader(body: value))
    }
    
    @discardableResult func attributeValues(_ value: [String: SKAttributeValue]) -> Next<ShapeModifiers.AttributeValues> {
        self.modifier(mod: ShapeModifiers.AttributeValues(body: value))
    }
    
}
