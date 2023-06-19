//
//  Fourier Series.swift
//  P5Demo
//
//  Created by Juan Hurtado on 19/06/23.
//

import Foundation
import UIKit
import P5Swift

class FourierSeries: P5Sketch {
    var time = 0.0
    
    override func setup() {
        title = "Fourier Series"
    }
    
    override func draw() {
        background(UIColor.black.cgColor)
        translate(150, 350)
        let radius = 100.0
        noFill()
        stroke(UIColor.white.cgColor)
        circle(0, 0, radius)
        
        let y = sin(time) * radius
        let x = cos(time) * radius
        fill(UIColor.white.cgColor)
        line(0, 0, x, y)
        circle(x, y, 8)
        
        time -= 0.01
    }
}
