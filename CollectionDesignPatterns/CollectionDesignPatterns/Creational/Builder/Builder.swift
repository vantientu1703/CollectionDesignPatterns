//
//  Builder.swift
//  CollectionDesignPatterns
//
//  Created by Văn Tiến Tú on 12/9/18.
//  Copyright © 2018 Văn Tiến Tú. All rights reserved.
//

import UIKit

class Moto {
    var name: String?
    var size: Int?
    var color: UIColor?
}


// Simple builder
class SimpleBuilder {
    func build(_ name: String? = nil, size: Int? = nil, color: UIColor? = nil) -> Moto? {
        let moto = Moto()
        moto.name = name
        moto.size = size
        moto.color = color
        return moto
    }
}

class UseSimpleBuiler {
    func usage() {
        let builder = SimpleBuilder()
        let moto = builder.build() // Here's that you can option parameters
        // ...
    }
}


// "Chained" builder
protocol MotoBuilderProtocol {
    func build() -> Moto?
    func setName(_ name: String?) -> MotoBuilder
    func setColor(_ color: UIColor?) -> MotoBuilder
    func setSize(_ size: Int?) -> MotoBuilder
}

class MotoBuilder: MotoBuilderProtocol {
    
    private var moto: Moto?
    
    init() {
        self.moto = Moto()
    }
    
    func build() -> Moto? {
        return self.moto
    }
    
    func setName(_ name: String?) -> MotoBuilder {
        self.moto?.name = name
        return self
    }
    
    func setColor(_ color: UIColor?) -> MotoBuilder {
        self.moto?.color = color
        return self
    }
    
    func setSize(_ size: Int?) -> MotoBuilder {
        self.moto?.size = size
        return self
    }
}


class UseChainedBuilder {
    
    func usage() {
        let builder = MotoBuilder()
        let moto = builder.setName("Motobike").setSize(10).setColor(.red).build()
        /// ....
    }
}

/// .....
class BarButtonBuilder {
    
    private var barButton: UIBarButtonItem!
    
    func barButtonSystemItem(_ barButtonSystemItem: UIBarButtonItem.SystemItem, target: Any?, action: Selector?) -> Self {
        self.barButton = UIBarButtonItem(barButtonSystemItem: barButtonSystemItem, target: target, action: action)
        return self
    }
    
    func setTitleTextAttributes(_ attributes: [NSAttributedString.Key : Any]?, for state: UIControl.State) -> Self {
        self.barButton.setTitleTextAttributes(attributes, for: state)
        return self
    }
    
    func setTintColor(_ color: UIColor) -> Self {
        self.barButton.tintColor = color
        return self
    }
    
    func addNaviLeftButton(_ _self: UIViewController) -> UIBarButtonItem {
        _self.navigationItem.leftBarButtonItem = self.barButton
        return self.barButton
    }
    
    func addNaviRightButton(_ _self: UIViewController) -> UIBarButtonItem {
        _self.navigationItem.rightBarButtonItem = self.barButton
        return self.barButton
    }
}

// The builder pattern with a director

class SKShapeNode {
    var name: String = ""
    var color: UIColor = .red
    var size: CGFloat = 0.0
}

protocol NodeBuilder {
    var name: String { get set }
    var color: UIColor { get set }
    var size: CGFloat { get set }
    
    func build() -> SKShapeNode
}

protocol NodeDirector {
    var builder: NodeBuilder { get set }
    
    func build() -> SKShapeNode
}

class CircleNodeBuilder: NodeBuilder {
    var name: String = ""
    var color: UIColor = .clear
    var size: CGFloat = 0
    
    func build() -> SKShapeNode {
        let node = SKShapeNode()
        node.name = self.name
        node.color = self.color
        return node
    }
}

class PlayerNodeDirector: NodeDirector {
    
    var builder: NodeBuilder
    
    init(builder: NodeBuilder) {
        self.builder = builder
    }
    
    func build() -> SKShapeNode {
        self.builder.name = "Hello"
        self.builder.size = 32
        self.builder.color = .red
        return self.builder.build()
    }
}

let builder = CircleNodeBuilder()
let director = PlayerNodeDirector(builder: builder)
let player = director.build()


// Block based builders. this is a design pattern or not ...

extension UILabel {
    
    static func build(block: (_ label: UILabel) -> ()) -> UILabel {
        let label = UILabel(frame: .zero)
        label.text = "text"
        block(label)
        return label
    }
}

