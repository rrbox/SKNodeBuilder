# Builder の作成と使い方

## Builder を作成する

### Overview

Builder はインスタンス化により作成できます.

```swift
let builder = Builder(nodeType: SKNode.self)
```

### Generator と Processor の設定方法

Generator は``Builder/setGenerator(_:)``メソッドでセットします. ``Generators`` 名前空間に用意されている make メソッドから Generator を作成します. 詳細は <doc:GeneratorUsage> を確認してください.

Processor は``Builder/setProcessor(_:)``メソッドでセットします.``Processor`` をインスタンス化し, ビルダーパターンでモディファイアを設定していきます. 詳細は <doc:ProcessorUsage> を確認してください.

```swift
let builder = Builder(nodeType: SKNode.self)
    .setGenerator(Generators<SKNode>.make(fileNamed: "YourNode"))
    .setProcessor(Processor<SKNode>()
        .modifier(mod:)
        .modifier(mod:)
        .modifier(mod:))
```

### Builder から SKNode インスタンスを生成する

Builder に Generator が設定されている場合に限り, ``Builder/node()-3u308``, ``Builder/node()-7cyn3``, ``Builder/node()-1s515`` のいずれかを使えるようになります. SKNode のインスタンスはこれらのメソッドから生成できます.

```swift
let node = builder.node()
```
