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
    var aux = 0.0
    
    override func draw() {
        aux += 0.1
        background(UIColor.white.cgColor)
        line(50, 50 + aux, 200, 350)
        rect(50, 450 - aux, 100, 120)
    }
}
