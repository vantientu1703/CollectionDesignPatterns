//
//  SimpleFactory.swift
//  CollectionDesignPatterns
//
//  Created by Văn Tiến Tú on 12/6/18.
//  Copyright © 2018 Văn Tiến Tú. All rights reserved.
//

import UIKit

// This is simple factory

enum CarType {
    case sedan, SUV, van
}

protocol Car {
    func drive()
}

class Sedan: Car {
    func drive() {
        print("drive a Sedan")
    }
}


class SUV: Car {
    func drive() {
        print("drive a SUV")
    }
}

class Van: Car {
    func drive() {
        print("drive a Van")
    }
}

class Factory {
    static func produceCar(_ type: CarType) -> Car {
        switch type {
        case .sedan:
            return Sedan()
        case .SUV:
            return SUV()
        case .van:
            return Van()
        }
    }
}

class SimpleFactory: NSObject {
    func usage() {
        let sedan = Factory.produceCar(.sedan)
        sedan.drive()
        
        // ..
    }
}

