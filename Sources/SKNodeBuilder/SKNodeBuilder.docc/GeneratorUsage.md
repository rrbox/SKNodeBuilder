# Generator の使い方

SKNodeBuilder では, SKNode インスタンスをどのように初期化するのかを Generator で表現します. 

## Overview

SKNodeBuilder がサポートする主な機能は, SpriteKit のノードインスタンスの生成方法をビルダーパターンで表現することです. 製作者の rrbox は, この生成方法を大きく二つの工程に分けて考えています.

1. ノードインスタンスの生成
2. 生成したノードインスタンスの加工

Generator は 1. ノードインスタンスの生成 を表現します.

## Generator を初期化する

Generator は ``Generators`` 名前空間の make メソッドを呼び出して作成します. この時, ``Generators`` にはジェネリクスでノードの型を指定する必要があります.

下のコードは, SKSpriteNode を生成する Generator の作成方法です.

```swift
_ = Generators<SKSpriteNode>.make(color: .red, size: CGSize(width: 32, height: 32))
```

``Generators`` から作成した Generator には, ``DefaultNodeGenerator/node()``, ``OptionalNodeGenerator/node()``, ``ThrowableNodeGenerator/node()`` のいずれかが実装されています.
