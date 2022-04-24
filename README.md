# SKNodeBuilder

2Dゲーム制作フレームワーク SpriteKit の SKNode を Builder パターンで設計できるようにする SwiftPM です。

## DEMO

### Builder

`Builder` オブジェクトをインスタンス化すると, イニシャライザに応じて内部に SKNode インスタンスが作成されます.
``` Swift
let rect = SKSpriteNode(color: .white, size: CGSize(width: 32, height: 32)
Builder<SKNode>()
    .position(CGPoint(x: 32, y: 100)) // 座標を設定
    .add(// 子ノードを追加(既に変数に保持されている場合)
        child: rect,
        build: { builder in
            builder
                .position(CGPoint(x: 0, y: 32)) // 子ノードの座標を設定
        }
    )
    .add(// 子ノードを追加
        child: Builder<SKLabelNode>(text: "Rect")
            .vertivalAlignment(.center)
            .horizontalAlignment(.center)
            .fontColor(.black)
            .position(x: -32, y: -32)
    )
```

### NodeBuilder

`Builder` の機能をアトリビュートで実装できます。
``` Swift
@NodeBuilder var node = SKNode()
func anyMethod() {
    // プロパティに $ をつけることで Builer ラッパのインスタンスにアクセスできます
    self.$node
        .add(child: SKSpriteNode(color: .white, size: CGSize(width: 32, height: 32)))
        .add(child: SKLabelNode(text: "Rect"), build: { builder in
            builder
                .position(x: -32, y: -32)
        })
}
```
## Builder で編集可能な SKNode 一覧
- SKNode
- SKSpriteNode
- SKLabelNode
- SKShapeNode
