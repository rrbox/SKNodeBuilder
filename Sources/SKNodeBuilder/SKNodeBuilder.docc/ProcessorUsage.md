# Processor の使い方

SKNodeBuilder では, SKNode インスタンスの特徴を Processor で表現します. 

## Overview

SKNodeBuilder がサポートする主な機能は, SpriteKit のノードインスタンスの生成方法をビルダーパターンで表現することです. 製作者の rrbox は, この生成方法を大きく二つの工程に分けて考えています.

1. ノードインスタンスの生成
2. 生成したノードインスタンスの加工

Processor は 2. 生成したノードインスタンスの加工 を表現します.


## Processor を作成する

Processor は, 構造体を初期化し, そのままメソッドチェーンでモディファイアを追加することで作成します.

### Processor の初期化

Processor は ``Processor`` をインスタンス化して生成します. Processor をインスタンス化するときは, 編集したいノードの型をジェネリクスで指定する必要があります.

```swift
let processor = Processor<SKNode>()

// その他のノードの場合
let processor = Processor<SKSpriteNode>()
let processor = Processor<SKLabelNode>()
let processor = Processor<SKShapeNode>()
```

### モディファイアの設定

Processor に ``ProcessorProtocol/position(_:)`` や ``ProcessorProtocol/alpha(_:)`` のようなモディファイアを追記します. モディファイアは ``ProcessorProtocol`` に定義されています.

```swift
let processor = Processor<SKNode>()
    .position(CGPoint(x: 32, y: 32))
    .alpha(0.5)
```

モディファイアをカスタマイズする場合は, <doc:ModiferCreate> を参照してください.

## Processor で SKNode インスタンスを編集する

``ProcessorProtocol/process(node:)`` を使って既存のノードインスタンスを編集できます. 編集はあらかじめ設定されたモディファイアに従って実行されます.

```swift
let node = SKNode()

processor.process(node: node)

print(node.position) // (32.0, 32.0)
print(node.alpha)    // 0.5
```
