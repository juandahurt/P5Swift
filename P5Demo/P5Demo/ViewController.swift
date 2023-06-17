//
//  ViewController.swift
//  P5Demo
//
//  Created by Juan Hurtado on 13/06/23.
//

import P5Swift
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let sketch = Test(ofSize: view.frame.size)
        view.addSubview(sketch.view)
    }


}

class Test: P5Sketch {
    let angle = CGFloat.pi / 4

    override func draw() {
        background(UIColor.white.cgColor)
        translate(width / 2, height / 2)
        branch(height: 100)
        noLoop()
    }
    
    func branch(height: CGFloat) {
        line(0, 0, 0, -height)
        translate(0, -height)
        guard height > 5 else { return }
//        let branches = Int.random(in: 1...4)
//        for _ in 0..<branches {
//            push()
//            rotate(.random(in: -(.pi / 3)...(.pi / 4)))
//            branch(height: height * 0.67)
//            pop()
//        }
        
        push()
        rotate(.pi / 4)
        branch(height: height * 0.67)
        pop()
        
        push()
        rotate(-.pi / 4)
        branch(height: height * 0.67)
        pop()
    }
}
