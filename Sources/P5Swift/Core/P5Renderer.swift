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
            case .fill(let color):
                fill(color)
            case .noFill:
                noFill()
            case .stroke(let color):
                stroke(color)
            case .background(let bgColor):
                background(bgColor)
            case .line(let x1, let y1, let x2, let y2):
                line(x1, y1, x2, y2)
            case .rect(let x, let y, let w, let h):
                rect(x, y, w, h)
            case .square(let x, let y, let size):
                square(x, y, size)
            case .circle(let x, let y, let r):
                circle(x, y, r)
            case .rotate(let angle):
                rotate(angle)
            case .translate(let x, let y):
                translate(x, y)
            case .push:
                push()
            case .pop:
                pop()
            }
        }
    }
    
    func clean() {
        operations.removeAll()
    }
}

extension P5Renderer {
    private func fill(_ color: CGColor) {
        P5DrawingSettings.instance.fillColor = color
    }
    
    private func noFill() {
        P5DrawingSettings.instance.fillColor = UIColor.clear.cgColor
    }
    
    private func stroke(_ color: CGColor) {
        P5DrawingSettings.instance.strokeColor = color
    }
}

extension P5Renderer {
    private func push() {
        guard let context else { return }
        context.saveGState()
    }
    
    func pop() {
        guard let context else { return }
        context.restoreGState()
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
        context.setStrokeColor(P5DrawingSettings.instance.strokeColor)
        context.beginPath()
        context.move(to: .init(x: x1, y: y1))
        context.addLine(to: .init(x: x2, y: y2))
        context.setLineWidth(1.0)
        context.strokePath()
    }
    
    private func rect(_ x: CGFloat, _ y: CGFloat, _ w: CGFloat, _ h: CGFloat) {
        guard let context else { return }
        context.setFillColor(P5DrawingSettings.instance.fillColor)
        context.fill([.init(x: x, y: y, width: w, height: h)])
    }
    
    private func square(_ x: CGFloat, _ y: CGFloat, _ size: CGFloat) {
        guard let context else { return }
        context.setFillColor(UIColor.blue.cgColor)
        context.fill([.init(x: x, y: y, width: size, height: size)])
    }
    
    private func circle(_ x: CGFloat, _ y: CGFloat, _ r: CGFloat) {
        guard let context else { return }
        // update the coordinates to draw from the center of the circle
        // rather than from the upper left corner
        let x = x - r
        let y = y - r
        
        let fillColor = P5DrawingSettings.instance.fillColor
        if fillColor != UIColor.clear.cgColor {
            context.setFillColor(P5DrawingSettings.instance.fillColor)
            context.fillEllipse(in: .init(x: x, y: y, width: r*2, height: r*2))
        }
        let strokeColor = P5DrawingSettings.instance.strokeColor
        if strokeColor != UIColor.clear.cgColor {
            context.setStrokeColor(strokeColor)
            context.strokeEllipse(in: .init(x: x, y: y, width: r*2, height: r*2))
        }
    }
}

extension P5Renderer {
    private func rotate(_ angle: CGFloat) {
        guard let context else { return }
        context.rotate(by: angle)
    }
    
    private func translate(_ x: CGFloat, _ y: CGFloat) {
        guard let context else { return }
        context.translateBy(x: x, y: y)
    }
}
