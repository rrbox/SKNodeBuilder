//
//  NodeMake.swift
//  
//
//  Created by rrbox on 2022/09/08.
//

import SpriteKit

protocol NodeInitType {
    associatedtype Node: SKNode
}
protocol NodeMake {
    associatedtype InitType: NodeInitType
    func make() -> InitType.Node
}

enum StandardParams<Node: SKNode>: NodeInitType {
    case none, coder(NSCoder), fileNamed(String), securelyWithClasses(String, Set<AnyHashable>)
}

/// ノードを遅延生成する構造体です.
public struct NodeInit<T: SKNode>: NodeMake {
    typealias InitType = StandardParams<T>
    
    let param: InitType
    
    func make() -> T {
        switch self.param {
        case .none:
            return T()
        case let .coder(aDecoder):
            return T(coder: aDecoder)!
        case let .fileNamed(fileName):
            return T(fileNamed: fileName)!
        case let .securelyWithClasses(fileName, classes):
            return try! T(fileNamed: fileName, securelyWithClasses: classes)
        }
    }
    
    public init() {
        self.param = .none
    }
    
    public init(coder aDecoder: NSCoder) {
        self.param = .coder(aDecoder)
    }
    
    public init(fileNamed fileName: String) {
        self.param = .fileNamed(fileName)
    }
    
    public init(fileNamed fileName: String, securelyWithClasses classes: Set<AnyHashable>) {
        self.param = .securelyWithClasses(fileName, classes)
    }
}
