//
//  ToothPicks.swift
//  P5Demo
//
//  Created by Juan Hurtado on 24/06/23.
//

import UIKit
import P5Swift

let length = 49.0
let depth = 20.0

var scale = 0.4
var toothpicks: [ToothPick] = []
var numberOfIterations = 1.0

class ToothPicks: P5Sketch {
    
    override func setup() {
        title = "Toothpicks"
        frameRate(5)
    }
    
    override func draw() {
        background(UIColor.white.cgColor)
        stroke(UIColor.black.cgColor)
        translate(width / 2, height / 2)
        let center: CGPoint = .zero
        toothpicks.append(.init(center: center, direction: .horizontal))
        
        var next: [ToothPick] = []
        for toothpick in toothpicks {
            drawToothpick(toothpick)
            if let a = toothpick.tryToGenerateA() {
                next.append(a)
            }
            if let b = toothpick.tryToGenerateB() {
                next.append(b)
            }
        }
        toothpicks.append(contentsOf: next)
        
        numberOfIterations += 1
        if numberOfIterations > depth { noLoop() }
    }
    
    func drawToothpick(_ toothpick: ToothPick) {
        line(toothpick.a.x, toothpick.a.y, toothpick.b.x, toothpick.b.y)
    }
}


internal class ToothPick {
    var a: CGPoint
    var b: CGPoint
    var direction: Direction
    
    enum Direction {
        case vertical, horizontal
    }
    
    init(center: CGPoint, direction: Direction) {
        self.direction = direction
        switch direction {
        case .vertical:
            a = .init(x: center.x, y: center.y - length * scale / 2)
            b = .init(x: center.x, y: center.y + length * scale / 2)
        case .horizontal:
            a = .init(x: center.x - length * scale / 2, y: center.y)
            b = .init(x: center.x + length * scale / 2, y: center.y)
        }
    }
    
    func tryToGenerateA() -> ToothPick? {
        let newA = ToothPick(center: a, direction: direction == .horizontal ? .vertical : .horizontal)
        var counter = 0
        for i in toothpicks.indices {
            if toothpicks[i].a == a || toothpicks[i].b == a {
                counter += 1
                if counter > 1 { break }
            }
        }
        return counter > 1 ? nil : newA
    }
    
    func tryToGenerateB() -> ToothPick? {
        let newB = ToothPick(center: b, direction: direction == .horizontal ? .vertical : .horizontal)
        var counter = 0
        for i in toothpicks.indices {
            if toothpicks[i].a == b || toothpicks[i].b == b {
                counter += 1
                if counter > 1 { break }
            }
        }
        return counter > 1 ? nil : newB
    }
}
