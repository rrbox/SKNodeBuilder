//
//  File.swift
//  
//
//  Created by rrbox on 2021/11/20.
//

import SpriteKit

public typealias LabelBuilder = Builder<SKLabelNode>

public extension LabelBuilder {
    
    convenience init(fontNamed fontName: String?) {
        self.init(.init(fontNamed: fontName))
    }
    
    convenience init(text: String?) {
        self.init(.init(text: text))
    }
    
    convenience init(attributedText: NSAttributedString?) {
        self.init(.init(attributedText: attributedText))
    }
    
}

public extension BuilderProtocol where Body: SKLabelNode {
    
    @discardableResult func text(_ value: String?) -> Self {
        self.node.text = value
        return self
    }
    
    @discardableResult func attributedText(_ value: NSAttributedString) -> Self {
        self.node.attributedText = value
        return self
    }
    
    @discardableResult func fontColor(_ value: SKColor?) -> Self {
        self.node.fontColor = value
        return self
    }
    
    @discardableResult func fontName(_ value: String?) -> Self {
        self.node.fontName = value
        return self
    }
    
    @discardableResult func fontSize(_ value: CGFloat) -> Self {
        self.node.fontSize = value
        return self
    }
    
    @discardableResult func vertivalAlignment(_ value: SKLabelVerticalAlignmentMode) -> Self {
        self.node.verticalAlignmentMode = value
        return self
    }
    
    @discardableResult func horizontalAlignment(_ value: SKLabelHorizontalAlignmentMode) -> Self {
        self.node.horizontalAlignmentMode = value
        return self
    }
    
    @discardableResult func preferredMaxLayoutWidth(_ value: CGFloat) -> Self {
        self.node.preferredMaxLayoutWidth = value
        return self
    }
    
    @discardableResult func lineBreakMode(_ value: NSLineBreakMode) -> Self {
        self.node.lineBreakMode = value
        return self
    }
    
    @discardableResult func numberOfLines(_ value: Int) -> Self {
        self.node.numberOfLines = value
        return self
    }
    
    @discardableResult func color(_ value: SKColor) -> Self {
        self.node.color = value
        return self
    }
    
    @discardableResult func colorBlendFactor(_ value: CGFloat) -> Self {
        self.node.colorBlendFactor = value
        return self
    }
    
    @discardableResult func blendMode(_ value: SKBlendMode) -> Self {
        self.node.blendMode = value
        return self
    }

}
