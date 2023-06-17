//
//  P5Operation.swift
//
//
//  Created by Juan Hurtado on 14/06/23.
//

import CoreGraphics

enum P5Operation {
    case background(CGColor)
    case line(CGFloat, CGFloat, CGFloat, CGFloat)
    case rect(CGFloat, CGFloat, CGFloat, CGFloat)
    case square(CGFloat, CGFloat, CGFloat)
    case circle(CGFloat, CGFloat, CGFloat)
    
    case rotate(CGFloat)
    case translate(CGFloat, CGFloat)
    
    case push, pop
}
