//
//  P5SketchInternal.swift
//  
//
//  Created by Juan Hurtado on 13/06/23.
//

import CoreGraphics

protocol P5SketchInternal {
    var renderer: P5Renderer { get set }

    var loop: Bool { get }
}
