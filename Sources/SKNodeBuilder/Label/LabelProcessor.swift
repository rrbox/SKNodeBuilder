//
//  LabelProcessor.swift
//  
//
//  Created by rrbox on 2021/11/20.
//

import SpriteKit

public typealias LabelProcessor<Node: SKLabelNode> = Processor<Node>

/// Name space of SKLabelNode builder's modifiers.
public enum LabelModifiers {
    public struct Text<Node: SKLabelNode>: Modifier {
        var body: String?
        
        public func mod(node: Node) {
            node.text = self.body
        }
    }

    public struct AttributedText<Node: SKLabelNode>: Modifier {
        var body: NSAttributedString
        
        public func mod(node: Node) {
            node.attributedText = self.body
        }
    }

    public struct FontColor<Node: SKLabelNode>: Modifier {
        var body: SKColor?
        
        public func mod(node: Node) {
            node.fontColor = self.body
        }
    }

    public struct FontName<Node: SKLabelNode>: Modifier {
        var body: String?
        
        public func mod(node: Node) {
            node.fontName = self.body
        }
    }

    public struct FontSize<Node: SKLabelNode>: Modifier {
        var body: CGFloat
        
        public func mod(node: Node) {
            node.fontSize = self.body
        }
    }

    public struct VerticalAlignment<Node: SKLabelNode>: Modifier {
        var body: SKLabelVerticalAlignmentMode
        
        public func mod(node: Node) {
            node.verticalAlignmentMode = self.body
        }
    }

    public struct HorizontalAlignment<Node: SKLabelNode>: Modifier {
        var body: SKLabelHorizontalAlignmentMode
        
        public func mod(node: Node) {
            node.horizontalAlignmentMode = self.body
        }
    }

    public struct PreferredMaxLayoutWidth<Node: SKLabelNode>: Modifier {
        var body: CGFloat
        
        public func mod(node: Node) {
            node.preferredMaxLayoutWidth = self.body
        }
    }

    public struct LineBreakMode<Node: SKLabelNode>: Modifier {
        var body: NSLineBreakMode
        
        public func mod(node: Node) {
            node.lineBreakMode = self.body
        }
    }

    public struct NumberOfLines<Node: SKLabelNode>: Modifier {
        var body: Int
        
        public func mod(node: Node) {
            node.numberOfLines = self.body
        }
    }

    public struct Color<Node: SKLabelNode>: Modifier {
        var body: SKColor
        
        public func mod(node: Node) {
            node.color = self.body
        }
    }

    public struct ColorBlendFactor<Node: SKLabelNode>: Modifier {
        var body: CGFloat
        
        public func mod(node: Node) {
            node.colorBlendFactor = self.body
        }
    }

    public struct BlendMode<Node: SKLabelNode>: Modifier {
        var body: SKBlendMode
        
        public func mod(node: Node) {
            node.blendMode = self.body
        }
    }

}

public extension ProcessorProtocol where Node: SKLabelNode {
    @discardableResult func text(_ value: String?) -> Next<LabelModifiers.Text<Node>> {
        self.modifier(mod: LabelModifiers.Text(body: value))
    }
    
    @discardableResult func attributedText(_ value: NSAttributedString) -> Next<LabelModifiers.AttributedText<Node>> {
        self.modifier(mod: LabelModifiers.AttributedText(body: value))
    }
    
    @discardableResult func fontColor(_ value: SKColor?) -> Next<LabelModifiers.FontColor<Node>> {
        self.modifier(mod: LabelModifiers.FontColor(body: value))
    }
    
    @discardableResult func fontName(_ value: String?) -> Next<LabelModifiers.FontName<Node>> {
        self.modifier(mod: LabelModifiers.FontName(body: value))
    }
    
    @discardableResult func fontSize(_ value: CGFloat) -> Next<LabelModifiers.FontSize<Node>> {
        self.modifier(mod: LabelModifiers.FontSize(body: value))
    }
    
    @discardableResult func verticalAlignment(_ value: SKLabelVerticalAlignmentMode) -> Next<LabelModifiers.VerticalAlignment<Node>> {
        self.modifier(mod: LabelModifiers.VerticalAlignment(body: value))
    }
    
    @discardableResult func horizontalAlignment(_ value: SKLabelHorizontalAlignmentMode) -> Next<LabelModifiers.HorizontalAlignment<Node>> {
        self.modifier(mod: LabelModifiers.HorizontalAlignment(body: value))
    }
    
    @discardableResult func preferredMaxLayoutWidth(_ value: CGFloat) -> Next<LabelModifiers.PreferredMaxLayoutWidth<Node>> {
        self.modifier(mod: LabelModifiers.PreferredMaxLayoutWidth(body: value))
    }
    
    @discardableResult func lineBreakMode(_ value: NSLineBreakMode) -> Next<LabelModifiers.LineBreakMode<Node>> {
        self.modifier(mod: LabelModifiers.LineBreakMode(body: value))
    }
    
    @discardableResult func numberOfLines(_ value: Int) -> Next<LabelModifiers.NumberOfLines<Node>> {
        self.modifier(mod: LabelModifiers.NumberOfLines(body: value))
    }
    
    @discardableResult func color(_ value: SKColor) -> Next<LabelModifiers.Color<Node>> {
        self.modifier(mod: LabelModifiers.Color(body: value))
    }
    
    @discardableResult func colorBlendFactor(_ value: CGFloat) -> Next<LabelModifiers.ColorBlendFactor<Node>> {
        self.modifier(mod: LabelModifiers.ColorBlendFactor(body: value))
    }
    
    @discardableResult func blendMode(_ value: SKBlendMode) -> Next<LabelModifiers.BlendMode<Node>> {
        self.modifier(mod: LabelModifiers.BlendMode(body: value))
    }

}
