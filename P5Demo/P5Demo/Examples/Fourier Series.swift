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
    var wave: [CGFloat] = []
    
    override func setup() {
        frameRate(60)
        title = "Fourier Series"
    }
    
    override func draw() {
        background(UIColor.black.cgColor)
        translate(80, 350)
        
        var x = 0.0
        var y = 0.0
        for i in 0..<4 {
            let prevX = x
            let prevY = y
            let n = Double(i) * 2.0 + 1.0
            let radius = 4 / n * .pi  * 5.0
            noFill()
            stroke(UIColor.white.withAlphaComponent(0.3).cgColor)
            circle(prevX, prevY, radius)
            
            y += radius * sin(n * time)
            x += radius * cos(n * time)
            stroke(UIColor.white.cgColor)
            line(prevX, prevY, x, y)
        }
        
        wave.insert(y, at: 0)
        // TODO: use a path for drawing the shape
        translate(120, 0)
        line(-120 + x, y, 0, wave[0])
        for index in wave.indices {
            fill(UIColor.white.cgColor)
            circle(CGFloat(index), wave[index], 2)
        }
        
        if wave.count > 150 {
            let _ = wave.popLast()
        }
        
        time -= 0.03
    }
}
