//
//  FractalOrganicTree.swift
//  P5Demo
//
//  Created by Juan Hurtado on 17/06/23.
//

import UIKit
import P5Swift


/// A kinda organic tree.
///
/// In this example it will try to draw a fractal tree, but with its angles and number
/// of branches randomly generated.
///
/// This will give us (not always) a more organic feel.
class FractalOrganicTree: P5Sketch {
    override func setup() {
        title = "Fractal 'organic' tree"
        stroke(UIColor.black.cgColor)
    }
    
    override func draw() {
        background(UIColor.white.cgColor)
        translate(width / 2, height - 50)
        branch(height: 100)
        noLoop()
    }
    
    func branch(height: CGFloat) {
        line(0, 0, 0, -height)
        translate(0, -height)
        guard height > 5 else { return }
        let branches = Int.random(in: 1...4)
        for _ in 0..<branches {
            push()
            rotate(.random(in: -(.pi / 4)...(.pi / 4)))
            branch(height: height * .random(in: 0.5...0.9))
            pop()
        }
    }
}
