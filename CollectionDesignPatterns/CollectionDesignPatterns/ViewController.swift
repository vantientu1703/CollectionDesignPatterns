//
//  ViewController.swift
//  CollectionDesignPatterns
//
//  Created by Văn Tiến Tú on 12/6/18.
//  Copyright © 2018 Văn Tiến Tú. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        BarButtonBuilder().barButtonSystemItem(.add, target: self, action: #selector(self.leftAction)).setTintColor(.red).addNaviLeftButton(self)
        
        let label = UILabel.build { (label) in
            //TODO
            print(label)
        }
        print(label)
    }
    
    @objc private func leftAction() {
        
    }
}

