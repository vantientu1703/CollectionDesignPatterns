//
//  FactoryMethod.swift
//  CollectionDesignPatterns
//
//  Created by Văn Tiến Tú on 12/6/18.
//  Copyright © 2018 Văn Tiến Tú. All rights reserved.
//

import UIKit

protocol Factories {
    func produce() -> Car
}


class SedanFactory {
    func produce() -> Car {
        return Factory.produceCar(.sedan)
    }
}

class SUVFactory: Factories {
    func produce() -> Car {
        return SUV()
    }
}

class VanFactory: Factories {
    func produce() -> Car {
        return Van()
    }
}

class FactoryMethod: NSObject {
    func usage() {
        let suvFactory = SUVFactory()
        let suv = suvFactory.produce()
        suv.drive()
        
        // ...
    }
}
