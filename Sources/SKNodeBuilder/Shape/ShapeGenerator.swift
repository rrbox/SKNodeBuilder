//
//  ShapeGenerator.swift
//  
//
//  Created by rrbox on 2022/11/09.
//

import SpriteKit

public enum ShapeGenerators {
    
    public struct Path<Node: SKShapeNode>: DefaultNodeGenerator {
        let path: CGPath
        public func node() -> Node {
            Node(path: self.path)
        }
    }
    
    public struct PathCenterd<Node: SKShapeNode>: DefaultNodeGenerator {
        let path: CGPath
        let centered: Bool
        public func node() -> Node {
            Node(path: self.path, centered: self.centered)
        }
    }
    
    public struct Rect<Node: SKShapeNode>: DefaultNodeGenerator {
        let rect: CGRect
        public func node() -> Node {
            Node(rect: self.rect)
        }
    }
    
    public struct RectOf<Node: SKShapeNode>: DefaultNodeGenerator {
        let size: CGSize
        public func node() -> Node {
            Node(rectOf: self.size)
        }
    }

    public struct RectCornerRadius<Node: SKShapeNode>: DefaultNodeGenerator {
        let rect: CGRect
        let cornerRadius: CGFloat
        public func node() -> Node {
            Node(rect: self.rect, cornerRadius: self.cornerRadius)
        }
    }
    
    public struct RectOfCornerRadius<Node: SKShapeNode>: DefaultNodeGenerator {
        let size: CGSize
        let cornerRadius: CGFloat
        public func node() -> Node {
            Node(rectOf: self.size, cornerRadius: self.cornerRadius)
        }
    }
    
    public struct CircleOfRadius<Node: SKShapeNode>: DefaultNodeGenerator {
        let radius: CGFloat
        public func node() -> Node {
            Node(circleOfRadius: self.radius)
        }
    }
    
    public struct EllipseOf<Node: SKShapeNode>: DefaultNodeGenerator {
        let size: CGSize
        public func node() -> Node {
            Node(ellipseOf: self.size)
        }
    }
    
    public struct EllipseIn<Node: SKShapeNode>: DefaultNodeGenerator {
        let rect: CGRect
        public func node() -> Node {
            Node(ellipseIn: self.rect)
        }
    }
    
    public struct PointsCount<Node: SKShapeNode>:DefaultNodeGenerator {
        let points: UnsafeMutablePointer<CGPoint>
        let numPoints: Int
        public func node() -> Node {
            Node(points: self.points, count: self.numPoints)
        }
    }
    
    public struct SplinePointsCount<Node: SKShapeNode>: DefaultNodeGenerator {
        let points: UnsafeMutablePointer<CGPoint>
        let numPoints: Int
        public func node() -> Node {
            Node(splinePoints: self.points, count: self.numPoints)
        }
    }
    
}

public extension Generators where Node: SKShapeNode {
    
    static func make(path: CGPath) -> ShapeGenerators.Path<Node> {
        .init(path: path)
    }
    
    static func make(path: CGPath, centered: Bool) -> ShapeGenerators.PathCenterd<Node> {
        .init(path: path, centered: centered)
    }
    
    static func make(rect: CGRect) -> ShapeGenerators.Rect<Node> {
        .init(rect: rect)
    }
    
    static func make(rectOf size: CGSize) -> ShapeGenerators.RectOf<Node> {
        .init(size: size)
    }
    
    static func make(rect: CGRect, cornerRadius: CGFloat) -> ShapeGenerators.RectCornerRadius<Node> {
        .init(rect: rect, cornerRadius: cornerRadius)
    }
    
    static func make(rectOf size: CGSize, cornerRadius: CGFloat) -> ShapeGenerators.RectOfCornerRadius<Node> {
        .init(size: size, cornerRadius: cornerRadius)
    }
    
    static func make(circleOfRadius radius: CGFloat) -> ShapeGenerators.CircleOfRadius<Node> {
        .init(radius: radius)
    }
    
    static func make(ellipseOf size: CGSize) -> ShapeGenerators.EllipseOf<Node> {
        .init(size: size)
    }
    
    static func make(ellipseIn rect: CGRect) -> ShapeGenerators.EllipseIn<Node> {
        .init(rect: rect)
    }
    
    static func make(points: UnsafeMutablePointer<CGPoint>, count numPoints: Int) -> ShapeGenerators.PointsCount<Node> {
        .init(points: points, numPoints: numPoints)
    }
    
    static func make(splinePoints points: UnsafeMutablePointer<CGPoint>, count numPoints: Int) -> ShapeGenerators.SplinePointsCount<Node> {
        .init(points: points, numPoints: numPoints)
    }
    
}
