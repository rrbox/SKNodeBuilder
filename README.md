# SKNodeBuilder

2Dゲーム制作フレームワーク SpriteKit での SKNode の構築・設定を簡易化するライブラリです。

## Builder

`Builder` オブジェクトをインスタンス化すると, イニシャライザに応じて内部に SKNode インスタンスが作成されます.
``` Swift
Builder<SKNode>()
    .position(CGPoint(x: 32, y: 100)) // 座標を設定
    .add(
        // 子ノードを追加
        child: SKSpriteNode(color: .white, size: CGSize(width: 32, height: 32),
        build: { builder in
            builder
                .position(CGPoint(x: 0, y: 32)) // 子ノードの座標を設定
        }
    )
    .add(child: SKLabelNode(text: "Rect"), build = { builder in
        builder
            .position(x: -32, y: -32)
    })
```

## NodeBuilder

`Builder` の機能をアトリビュートで実装できます。
``` Swift
@NodeBuilder var node = SKNode()
func anyMethod() {
    // プロパティに $ をつけることで Builer ラッパのインスタンスにアクセスできます
    self.$node
        .add(child: SKSpriteNode(color: .white, size: CGSize(width: 32, height: 32)))
        .add(child: SKLabelNode(text: "Rect"), build = { builder in
        builder
            .position(x: -32, y: -32)
    })
}
```
