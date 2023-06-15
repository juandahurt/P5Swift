//
//  P5Renderer.swift
//  
//
//  Created by Juan Hurtado on 13/06/23.
//

import UIKit // remove (?)
import CoreGraphics

class P5Renderer {
    var size: CGSize = .zero
    var context: CGContext?
    private var operations: [P5Operation] = []
    
    internal func addOperation(_ operation: P5Operation) {
        operations.append(operation)
    }
    
    func drawOperations() {
        for operation in operations {
            switch operation {
            case .background(let bgColor):
                background(bgColor)
            case .line(let x1, let y1, let x2, let y2):
                line(x1, y1, x2, y2)
            }
        }
    }
    
    func clean() {
        operations.removeAll()
    }
}

extension P5Renderer {
    private func background(_ bgColor: CGColor) {
        guard let context else { return }
        context.setFillColor(bgColor)
        context.fill([.init(origin: .zero, size: size)])
    }
    
    private func line(_ x1: CGFloat, _ y1: CGFloat, _ x2: CGFloat, _ y2: CGFloat) {
        guard let context else { return }
        context.setStrokeColor(UIColor.black.cgColor)
        context.beginPath()
        context.move(to: .init(x: x1, y: y1))
        context.addLine(to: .init(x: x2, y: y2))
        context.setLineWidth(1.0)
        context.strokePath()
    }
}
