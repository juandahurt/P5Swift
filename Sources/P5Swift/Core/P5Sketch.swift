//
//  P5Sketch.swift
//  
//
//  Created by Juan Hurtado on 14/06/23.
//

import UIKit

open class P5Sketch {
    private var internalView: P5SketchInternalView
    
    /// The actual sketch view.
    ///
    /// Just add this view to your view hierarchy
    ///
    /// ```swift
    /// // inside your view controller
    /// let sketch = YourSketch(ofSize: view.size)
    /// view.addSubview(skecth.view)
    /// // and that's it!
    /// ```
    public var view: UIView {
        internalView
    }
    
    public init(ofSize size: CGSize) {
        internalView = P5SketchInternalView(size: size)
        internalView.onDraw = onInternalDraw
    }
    
    private func onInternalDraw() {
        draw()
    }
    
    /// Its called once the app starts
    open func setup() {}
    
    /// It gets called every frame. This is where you should perform draw operations
    open func draw() {}
}

public extension P5Sketch {
    /// Sets the color for the canvas background
    /// - Parameter bgColor: The desired color
    func background(_ bgColor: CGColor) {
        internalView.addOperation(.background(bgColor))
    }
    
    /// Draws a line on the canvas
    /// - Parameters:
    ///   - x1: Initial x position
    ///   - y1: Initial y position
    ///   - x2: End x position
    ///   - y2: End x position
    func line(_ x1: CGFloat, _ y1: CGFloat, _ x2: CGFloat, _ y2: CGFloat) {
        internalView.addOperation(.line(x1, y1, x2, y2))
    }
    
    
    /// Draws a rectangle on the canvas.
    /// - Parameters:
    ///   - x: Upper left x position
    ///   - y: Upper left y position
    ///   - w: Rectangle's width
    ///   - h: Ractangle's height
    func rect(_ x: CGFloat, _ y: CGFloat, _ w: CGFloat, _ h: CGFloat) {
        internalView.addOperation(.rect(x, y, w, h))
    }
    
    func square(_ x: CGFloat, _ y: CGFloat, _ size: CGFloat) {
        internalView.addOperation(.square(x, y, size))
    }
}
