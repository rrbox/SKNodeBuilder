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
    public struct Path<Node: SKShapeNode>: Modifier {
        var body: CGPath?
        
        public func mod(node: Node) {
            node.path = self.body
        }
        
    }
    
    public struct FillColor<Node: SKShapeNode>: Modifier {
        var body: SKColor
        
        public func mod(node: Node) {
            node.fillColor = self.body
        }
        
    }
    
    public struct FillTexture<Node: SKShapeNode>: Modifier {
        var body: SKTexture?
        
        public func mod(node: Node) {
            node.fillTexture = self.body
        }
        
    }

    public struct LineWidth<Node: SKShapeNode>: Modifier {
        var body: CGFloat
        
        public func mod(node: Node) {
            node.lineWidth = self.body
        }
        
    }
    
    public struct StrokeColor<Node: SKShapeNode>: Modifier {
        var body: SKColor
        
        public func mod(node: Node) {
            node.strokeColor = self.body
        }
        
    }

    public struct StrokeTexture<Node: SKShapeNode>: Modifier {
        var body: SKTexture?
        
        public func mod(node: Node) {
            node.strokeTexture = self.body
        }
        
    }

    public struct GlowWidth<Node: SKShapeNode>: Modifier {
        var body: CGFloat
        
        public func mod(node: Node) {
            node.glowWidth = self.body
        }
        
    }

    public struct LineCap<Node: SKShapeNode>: Modifier {
        var body: CGLineCap
        
        public func mod(node: Node) {
            node.lineCap = self.body
        }
        
    }

    public struct LineJoin<Node: SKShapeNode>: Modifier {
        var body: CGLineJoin
        
        public func mod(node: Node) {
            node.lineJoin = self.body
        }
        
    }

    public struct MiterLimit<Node: SKShapeNode>: Modifier {
        var body: CGFloat
        
        public func mod(node: Node) {
            node.miterLimit = self.body
        }
        
    }
    
    public struct IsAntialiased<Node: SKShapeNode>: Modifier {
        var body: Bool
        
        public func mod(node: Node) {
            node.isAntialiased = self.body
        }
        
    }

    public struct BlendMode<Node: SKShapeNode>: Modifier {
        var body: SKBlendMode
        
        public func mod(node: Node) {
            node.blendMode = self.body
        }
        
    }
    
    public struct StrokeShader<Node: SKShapeNode>: Modifier {
        var body: SKShader?
        
        public func mod(node: Node) {
            node.strokeShader = self.body
        }
        
    }

    public struct FillShader<Node: SKShapeNode>: Modifier {
        var body: SKShader?
        
        public func mod(node: Node) {
            node.fillShader = self.body
        }
        
    }
    
    public struct AttributeValues<Node: SKShapeNode>: Modifier {
        var body: [String: SKAttributeValue]
        
        public func mod(node: Node) {
            node.attributeValues = self.body
        }
        
    }
    
}

public extension ProcessorProtocol where Node: SKShapeNode {
    func path(_ value: CGPath?) -> Next<ShapeModifiers.Path<Node>> {
        self.modifier(mod: ShapeModifiers.Path(body: value))
    }
    
    func fillColor(_ value: SKColor) -> Next<ShapeModifiers.FillColor<Node>> {
        self.modifier(mod: ShapeModifiers.FillColor(body: value))
    }
    
    func fillTexture(_ value: SKTexture?) -> Next<ShapeModifiers.FillTexture<Node>> {
        self.modifier(mod: ShapeModifiers.FillTexture(body: value))
    }
    
    func lineWidth(_ value: CGFloat) -> Next<ShapeModifiers.LineWidth<Node>> {
        self.modifier(mod: ShapeModifiers.LineWidth(body: value))
    }
    
    func strokeColor(_ value: SKColor) -> Next<ShapeModifiers.StrokeColor<Node>> {
        self.modifier(mod: ShapeModifiers.StrokeColor(body: value))
    }
    
    func strokeTexture(_ value: SKTexture?) -> Next<ShapeModifiers.StrokeTexture<Node>> {
        self.modifier(mod: ShapeModifiers.StrokeTexture(body: value))
    }
    
    func glowWidth(_ value: CGFloat) -> Next<ShapeModifiers.GlowWidth<Node>> {
        self.modifier(mod: ShapeModifiers.GlowWidth(body: value))
    }
    
    func lineCap(_ value: CGLineCap) -> Next<ShapeModifiers.LineCap<Node>> {
        self.modifier(mod: ShapeModifiers.LineCap(body: value))
    }
    
    func lineJoin(_ value: CGLineJoin) -> Next<ShapeModifiers.LineJoin<Node>> {
        self.modifier(mod: ShapeModifiers.LineJoin(body: value))
    }
    
    func miterLimit(_ value: CGFloat) -> Next<ShapeModifiers.MiterLimit<Node>> {
        self.modifier(mod: ShapeModifiers.MiterLimit(body: value))
    }
    
    func isAntialiased(_ value: Bool) -> Next<ShapeModifiers.IsAntialiased<Node>> {
        self.modifier(mod: ShapeModifiers.IsAntialiased(body: value))
    }
    
    func blendMode(_ value: SKBlendMode) -> Next<ShapeModifiers.BlendMode<Node>> {
        self.modifier(mod: ShapeModifiers.BlendMode(body: value))
    }
    
    func strokeShader(_ value: SKShader?) -> Next<ShapeModifiers.StrokeShader<Node>> {
        self.modifier(mod: ShapeModifiers.StrokeShader(body: value))
    }
    
    func fillShader(_ value: SKShader?) -> Next<ShapeModifiers.FillShader<Node>> {
        self.modifier(mod: ShapeModifiers.FillShader(body: value))
    }
    
    func attributeValues(_ value: [String: SKAttributeValue]) -> Next<ShapeModifiers.AttributeValues<Node>> {
        self.modifier(mod: ShapeModifiers.AttributeValues(body: value))
    }
    
}
