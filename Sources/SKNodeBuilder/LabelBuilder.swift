//
//  File.swift
//  
//
//  Created by rrbox on 2021/11/20.
//

import SpriteKit

public typealias LabelBuilder = Builder<SKLabelNode>

/// name space of SKLabelNode builder's modifiers.
public enum Label {
    public struct Text: Modifier {
        var body: String?
        
        public func mod(node: SKLabelNode) {
            node.text = self.body
        }
    }

    public struct AttributedText: Modifier {
        var body: NSAttributedString
        
        public func mod(node: SKLabelNode) {
            node.attributedText = self.body
        }
    }

    public struct FontColor: Modifier {
        var body: SKColor?
        
        public func mod(node: SKLabelNode) {
            node.fontColor = self.body
        }
    }

    public struct FontName: Modifier {
        var body: String?
        
        public func mod(node: SKLabelNode) {
            node.fontName = self.body
        }
    }

    public struct FontSize: Modifier {
        var body: CGFloat
        
        public func mod(node: SKLabelNode) {
            node.fontSize = self.body
        }
    }

    public struct VerticalAlignment: Modifier {
        var body: SKLabelVerticalAlignmentMode
        
        public func mod(node: SKLabelNode) {
            node.verticalAlignmentMode = self.body
        }
    }

    public struct HorizontalAlignment: Modifier {
        var body: SKLabelHorizontalAlignmentMode
        
        public func mod(node: SKLabelNode) {
            node.horizontalAlignmentMode = self.body
        }
    }

    public struct PreferredMaxLayoutWidth: Modifier {
        var body: CGFloat
        
        public func mod(node: SKLabelNode) {
            node.preferredMaxLayoutWidth = self.body
        }
    }

    public struct LineBreakMode: Modifier {
        var body: NSLineBreakMode
        
        public func mod(node: SKLabelNode) {
            node.lineBreakMode = self.body
        }
    }

    public struct NumberOfLines: Modifier {
        var body: Int
        
        public func mod(node: SKLabelNode) {
            node.numberOfLines = self.body
        }
    }

    public struct Color: Modifier {
        var body: SKColor
        
        public func mod(node: SKLabelNode) {
            node.color = self.body
        }
    }

    public struct ColorBlendFactor: Modifier {
        var body: CGFloat
        
        public func mod(node: SKLabelNode) {
            node.colorBlendFactor = self.body
        }
    }

    public struct BlendMode: Modifier {
        var body: SKBlendMode
        
        public func mod(node: SKLabelNode) {
            node.blendMode = self.body
        }
    }

}

public extension BuilderProtocol where Node == SKLabelNode {
    
    @discardableResult func text(_ value: String?) -> Next<Label.Text> {
        self.modifier(mod: Label.Text(body: value))
    }
    
    @discardableResult func attributedText(_ value: NSAttributedString) -> Next<Label.AttributedText> {
        self.modifier(mod: Label.AttributedText(body: value))
    }
    
    @discardableResult func fontColor(_ value: SKColor?) -> Next<Label.FontColor> {
        self.modifier(mod: Label.FontColor(body: value))
    }
    
    @discardableResult func fontName(_ value: String?) -> Next<Label.FontName> {
        self.modifier(mod: Label.FontName(body: value))
    }
    
    @discardableResult func fontSize(_ value: CGFloat) -> Next<Label.FontSize> {
        self.modifier(mod: Label.FontSize(body: value))
    }
    
    @discardableResult func verticalAlignment(_ value: SKLabelVerticalAlignmentMode) -> Next<Label.VerticalAlignment> {
        self.modifier(mod: Label.VerticalAlignment(body: value))
    }
    
    @discardableResult func horizontalAlignment(_ value: SKLabelHorizontalAlignmentMode) -> Next<Label.HorizontalAlignment> {
        self.modifier(mod: Label.HorizontalAlignment(body: value))
    }
    
    @discardableResult func preferredMaxLayoutWidth(_ value: CGFloat) -> Next<Label.PreferredMaxLayoutWidth> {
        self.modifier(mod: Label.PreferredMaxLayoutWidth(body: value))
    }
    
    @discardableResult func lineBreakMode(_ value: NSLineBreakMode) -> Next<Label.LineBreakMode> {
        self.modifier(mod: Label.LineBreakMode(body: value))
    }
    
    @discardableResult func numberOfLines(_ value: Int) -> Next<Label.NumberOfLines> {
        self.modifier(mod: Label.NumberOfLines(body: value))
    }
    
    @discardableResult func color(_ value: SKColor) -> Next<Label.Color> {
        self.modifier(mod: Label.Color(body: value))
    }
    
    @discardableResult func colorBlendFactor(_ value: CGFloat) -> Next<Label.ColorBlendFactor> {
        self.modifier(mod: Label.ColorBlendFactor(body: value))
    }
    
    @discardableResult func blendMode(_ value: SKBlendMode) -> Next<Label.BlendMode> {
        self.modifier(mod: Label.BlendMode(body: value))
    }

}
