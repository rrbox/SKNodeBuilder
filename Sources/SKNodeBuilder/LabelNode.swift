//
//  File.swift
//  
//
//  Created by rrbox on 2021/11/20.
//

import SpriteKit
public typealias LabelNode = Node<SKLabelNode>
public extension LabelNode {
    @discardableResult func text(_ text: String?) -> Self {
        self.body.text = text
        return self
    }
    @discardableResult func attributedText(_ attributedText: NSAttributedString) -> Self {
        self.body.attributedText = attributedText
        return self
    }
    @discardableResult func fontColor(_ fontColor: SKColor?) -> Self {
        self.body.fontColor = fontColor
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
    @discardableResult func preferredMaxLayoutWidth(_ preferredMaxLayoutWidth: CGFloat) -> Self {
        self.body.preferredMaxLayoutWidth = preferredMaxLayoutWidth
        return self
    }
    @discardableResult func lineBreakMode(_ lineBreakMode: NSLineBreakMode) -> Self {
        self.body.lineBreakMode = lineBreakMode
        return self
    }
    @discardableResult func numberOfLines(_ numberOfLines: Int) -> Self {
        self.body.numberOfLines = numberOfLines
        return self
    }
    @discardableResult func fontName(_ fontName: String?) -> Self {
        self.body.fontName = fontName
        return self
    }
    @discardableResult func fontSize(_ size: CGFloat) -> Self {
        self.body.fontSize = size
        return self
    }
    @discardableResult func vertivalAlignment(_ align: SKLabelVerticalAlignmentMode) -> Self {
        self.body.verticalAlignmentMode = align
        return self
    }
    @discardableResult func horizontalAlignment(_ align: SKLabelHorizontalAlignmentMode) -> Self {
        self.body.horizontalAlignmentMode = align
        return self
    }
}
