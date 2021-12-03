# SKNodeBuilder

2Dゲーム制作フレームワーク SpriteKit での SKNode の構築・設定を簡易化するライブラリです。

## Builder

SKNode を `Builder` オブジェクトでラップして使用します。
``` Swift
var builder = Builder(SKNode())
    .position(CGPoint(x: 32, y: 100)) // 座標を設定
    .addChild(
        // 子ノードを追加
        Node(SKSpriteNode(color: .white, size: CGSize(width: 32, height: 32)
            .position(CGPoint(x: 0, y: 32)) // 子ノードの座標を設定
    )
    .addChild(
        Builer(SKLabelNode(text: "Rect"))
            .position(x: -32, y: -32)
    )
```

## NodeBuilder

`Builder` の機能をアトリビュートで実装できます。
``` Swift
@NodeBuilder var node = SKNode()
func anyMethod() {
    // プロパティに $ をつけることで Builer ラッパのインスタンスにアクセスできます
    self.$node
        .addChild(Node(SKSpriteNode(color: .white, size: CGSize(width: 32, height: 32)))
        .addChild(
            SKLabelNode(text: "Rect")
                .position(x: -32, y: -32)
        )
}
```
