//
//  AbstractFactory.swift
//  CollectionDesignPatterns
//
//  Created by Văn Tiến Tú on 12/6/18.
//  Copyright © 2018 Văn Tiến Tú. All rights reserved.
//

import UIKit


class CompactSedan: Sedan {
    override func drive() {
        print("drive a compact Sedant")
    }
}

class MidSizeSedant: Sedan {
    override func drive() {
        print("drive a mid size Sedan")
    }
}

class FullSizeSedan: Sedan {
    override func drive() {
        print("drive a full size Sedan")
    }
}

class CompactSUV: SUV {
    override func drive() {
        print("drive a compact SUV")
    }
}

class MidSizeSUV: SUV {
    override func drive() {
        print("drive a mid size SUV")
    }
}

class FullSizeSUV: SUV {
    override func drive() {
        print("drive a full size SUV")
    }
}

protocol FactoryCar {
    func produceSUV() -> Car
    func produceSedan() -> Car
}

class FactoryCompactCar: FactoryCar {
    
    func produceSUV() -> Car {
        return CompactSUV()
    }
    
    func produceSedan() -> Car {
        return CompactSedan()
    }
}

class FactoryFullSizeCar: FactoryCar {
    
    func produceSUV() -> Car {
        return FullSizeSUV()
    }
    
    func produceSedan() -> Car {
        return FullSizeSedan()
    }
}

class AbstractMethod: NSObject {
    func usage() {
        let compactFactory = FactoryCompactCar()
        let compactSedan = compactFactory.produceSedan()
        compactSedan.drive()
        
        // ...
    }
}
