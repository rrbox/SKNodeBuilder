# Modifier の作成方法

Processor で使用する Modifier は ``Modifier`` を使用してカスタマイズできます.

## Overview

SKNodeBuilder の Processor ですでに定義されている Modifier は, ``ProcessorProtocol/modifier(mod:)`` をラップしています. Modifier を作成するには, ``ProcessorProtocol/modifier(mod:)`` の引数で使われている型を定義する必要があります. そして, 人によっては ``ProcessorProtocol/modifier(mod:)`` をわかりやすいメソッドでラップしたいかもしれません. 安心してください. SKNodeBuilder では, modifier メソッドをラップする API も提供しています.

## Modifier を構造体で実装する

``ProcessorProtocol/modifier(mod:)`` の引数にセットできる型を定義することで, 新しい Modifier として機能させることができます.

### Modifier の構造体を定義する

``Modifier`` プロトコルで Modifier の構造体を実装できます. ``Modifier/Node`` と ``Modifier/mod(node:)`` は必須です.

```swift
struct Hello: Modifier {
    typealias Node = SKLabelNode
    
    func mod(node: SKLabelNode) {
        node.text = "Hello"
    }
}
```

SKLabelNode だけでなく, そのサブクラスに対してもサポートしたい場合は, このようにします.

```swift
struct Hello<Node: SKLabelNode>: Modifier {
    func mod(node: Node) {
        node.text = "Hello"
    }
}
```

### 定義した構造体を Processor にセットする

定義した Modifier は, ``ProcessorProtocol/modifier(mod:)`` で Processor にセットできます.

```swift
let processor = Processor<SKLabelNode>()
    .modifier(mod: Hello())
```

processor を使ってみましょう.

```swift
let label = SKLabelNode()
processor.process(node: label)

print(label.text) // "Hello"
```

## メソッド名をわかりやすくする

``ProcessorProtocol`` を拡張して, オリジナルのモディファイアメソッドを作成します.

以下のような extension を作成します.

```swift
extension ProcessorProtocol where Node == SKLabelNode {
    func hello() -> Next<Hello> {
        self.modifier(mod: Hello())
    }
}
```

重要な箇所は以下の3つです.

- where 文で Node に型制約をかけることができる
- 返り値が `Next<T>` で隠蔽されている
- メソッドの中は, 必ず `self.modifier(mod:)`

SKLabelNode のサブクラスにも対応させる場合はこのようにします.


```swift
extension ProcessorProtocol where Node: SKLabelNode {
    func hello() -> Next<Hello> {
        self.modifier(mod: Hello())
    }
}
```

