//
//  Starfield.swift
//  P5Demo
//
//  Created by Juan Hurtado on 18/06/23.
//

import UIKit
import CoreFoundation
import P5Swift

/// A Starfield simulation.
///
/// In this example it shows n starts at random positions on the screen. Each star has three variables: x, y and z. The last one
/// indicates how far a star is from the camera.
///
/// Note that it translates to the center of the screen at each frame. If we dont do that, the translations will be made from the
/// upper left corner.
class Starfield: P5Sketch {
    let numStars = 150
    var stars: [Star] = []
    
    override func setup() {
        title = "Starfield simulation"
        frameRate(60)
        stars = (0..<numStars).map { _ in
            .init(canvasSize: .init(width: width, height: height))
        }
    }
    
    override func draw() {
        background(UIColor.black.cgColor)
        translate(width / 2, height / 2)
        for index in stars.indices {
            stars[index].update()
            showStar(atIndex: index)
        }
    }
    
    func showStar(atIndex index: Int) {
        var star = stars[index]
        fill(UIColor.white.cgColor)
        let newX = star.x / star.z * width
        let newY = star.y / star.z * height
        star.updateCoordinates(x: newX, y: newY)
        let radius = (1.0 - star.z / width) * 16.0
        circle(star.x, star.y, radius)
    }
    
    struct Star {
        var x: CGFloat
        var y: CGFloat
        var z: CGFloat
        
        let size: CGSize
        
        init(canvasSize size: CGSize) {
            x = .random(in: -size.width/2..<size.width/2)
            y = .random(in: -size.height/2..<size.height/2)
            z = .random(in: 0..<size.width)
            self.size = size
        }
        
        mutating func update() {
            z -= 10
            if z < 1 {
                z = size.width
                x = .random(in: -size.width/2..<size.width/2)
                y = .random(in: -size.height/2..<size.height/2)
            }
        }
        
        mutating func updateCoordinates(x: CGFloat, y: CGFloat) {
            self.x = x
            self.y = y
        }
    }
}
