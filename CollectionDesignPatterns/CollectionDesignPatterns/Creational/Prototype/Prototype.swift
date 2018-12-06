//
//  Prototype.swift
//  CollectionDesignPatterns
//
//  Created by Văn Tiến Tú on 12/9/18.
//  Copyright © 2018 Văn Tiến Tú. All rights reserved.
//

import UIKit

protocol Game {
    func setupScore(teamA: Int, teamB: Int)
    func clone() -> Game
}

class FootBall: Game {
    
    init() {
        
    }
    
    init(football: FootBall) {
        
    }
    
    func setupScore(teamA: Int, teamB: Int) {
        
    }
    
    func clone() -> Game {
        return FootBall(football: self)
    }
}

class Prototype: NSObject {

}
