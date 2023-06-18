//
//  P5SketchInternalView.swift
//
//
//  Created by Juan Hurtado on 13/06/23.
//

import CoreGraphics
import UIKit

class P5SketchInternalView: UIView, P5SketchInternal {
    internal var renderer: P5Renderer
    internal var loop: Bool = true {
        didSet {
            if !oldValue && loop {
                setNeedsDisplay()
            }
        }
    }
    internal var userWantsRedraw = false {
        didSet {
            if !oldValue && userWantsRedraw {
                setNeedsDisplay()
            }
        }
    }
    internal var framesPerSecond = 30.0
    
    var setup: () -> Void = {}
    var onDraw: () -> Void = {}
    
    public init(size: CGSize) {
        renderer = P5Renderer()
        renderer.size = size
        setup()
        super.init(frame: .init(origin: .zero, size: size))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func draw(_ rect: CGRect) {
        renderer.context = UIGraphicsGetCurrentContext()
        if loop || userWantsRedraw {
            onDraw()
            renderer.drawOperations()
            // Curious... if I call the `setNeedsDisplay` function without
            // the DispatchQueue.main it won't loop
            DispatchQueue.main.asyncAfter(deadline: .now() + 1 / framesPerSecond) { [weak self] in
                guard let self else { return }
                self.setNeedsDisplay()
            }
            userWantsRedraw = false
        }
        renderer.clean()
    }
    
    func addOperation(_ operation: P5Operation) {
        renderer.addOperation(operation)
    }
}
