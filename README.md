# SKNodeBuilder

[![GitHub issues](https://img.shields.io/github/issues/rrbox/SKNodeBuilder)](https://github.com/rrbox/SKNodeBuilder/issues)
[![GitHub license](https://img.shields.io/github/license/rrbox/SKNodeBuilder)](https://github.com/rrbox/SKNodeBuilder/blob/main/LICENSE)

2Dゲーム制作フレームワーク SpriteKit の SKNode を Builder パターンで設計できるようにする SwiftPM です。

## DEMO

### Builder

`Builder` オブジェクトをインスタンス化すると, イニシャライザに応じて内部に SKNode インスタンスが作成されます.

```swift
let node = Builder(nodeType: SKNode.self)
    .setGenerator(Generators<SKNode>.make(fileNamed: "YourNode"))
    .setProcessor(Processor<SKNode>()
        .position(CGPoint(x: 32, y: 32)) // 座標をセットします
        .alpha(0.5)                      // alpha 値をセットします
    )
    .node()                              // ビルダーからノードを生成します.
```

### Processor

すでに作成されたノードインスタンスを, 決められたフローに従って編集します.

```swift
// 編集フローの作成

let processor = Processor<SKNode>()
    .position(CGPoint(x: 32, y: 32)) // 座標をセットします
    .alpha(0.5)                      // alpha 値をセットします
```

```swift
// ノードをインスタンス化し, 編集します

let node = SKNode()

processor.process(node: node)

print(node.position) // (32.0, 32.0)
print(node.alpha)    // 0.5

```

## Builder で編集可能な SKNode 一覧
- SKNode
- SKSpriteNode
- SKLabelNode
- SKShapeNode
