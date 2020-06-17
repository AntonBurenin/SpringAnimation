//
//  Animation.swift
//  SpringAnimation
//
//  Created by Bober on 17/06/2020.
//  Copyright © 2020 AntonBu. All rights reserved.
//

struct Animation {
    let name: String
    let curve: String
    let duration: Float
    let force: Float
    
    func getDescription() -> String {
        let description = """
        Name: \(name)
        Curve: \(curve)
        Duration: \( String(format: "%.2f", duration))
        Force: \( String(format: "%.2f", force))
        """
        return description
    }
    
    static func getAnimationList() -> [Animation] {
        
        var animations: [Animation] = []
        
        let names = DataManager.shared.names.shuffled()
        let curves = DataManager.shared.curves.shuffled()
        let count = min(names.count, curves.count)
        
        for index in 0..<count {
            let animation = Animation(name: names[index],
                                      curve: curves[index],
                                      duration: Float.random(in: 0.3...1.5),
                                      force: Float.random(in: 0.3...5))
            animations.append(animation)
        }
        
        return animations
    }
}


