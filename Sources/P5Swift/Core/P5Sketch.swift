//
//  P5Sketch.swift
//  
//
//  Created by Juan Hurtado on 14/06/23.
//

import UIKit

open class P5Sketch {
    private var internalView: P5SketchInternalView
    
    /// Canvas width
    public var width: CGFloat
    
    /// Canvas height
    public var height: CGFloat
    
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
        width = size.width
        height = size.height
        internalView.onDraw = onInternalDraw
    }
    
    private func onInternalDraw() {
        draw()
    }
    
    // Its called once the app starts
    open func setup() {}
    
    /// It gets called every frame. This is where you should perform draw operations
    open func draw() {}
}

// MARK: - Structure
public extension P5Sketch {
    /// <#Description#>
    func push() {
        internalView.addOperation(.push)
    }
    
    /// <#Description#>
    func pop() {
        internalView.addOperation(.pop)
    }
    
    func loop() {
        internalView.loop = true
    }
    
    func noLoop() {
        internalView.loop = false
    }
}

// MARK: - 2D primitives
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
    
    /// Draws a square on the canvas.
    /// - Parameters:
    ///   - x: The x position
    ///   - y: The y position
    ///   - size: The width and hight of the square
    func square(_ x: CGFloat, _ y: CGFloat, _ size: CGFloat) {
        internalView.addOperation(.square(x, y, size))
    }
    
    /// Draws a circle on the canvas
    /// - Parameters:
    ///   - x: The x position
    ///   - y: The y position
    ///   - r: The radius of the circle
    func circle(_ x: CGFloat, _ y: CGFloat, _ r: CGFloat) {
        internalView.addOperation(.circle(x, y, r))
    }
}


// MARK: - Transformations
public extension P5Sketch {
    /// <#Description#>
    /// - Parameter angle: <#angle description#>
    func rotate(_ angle: CGFloat) {
        internalView.addOperation(.rotate(angle))
    }
    
    /// <#Description#>
    /// - Parameters:
    ///   - x: <#x description#>
    ///   - y: <#y description#>
    func translate(_ x: CGFloat, _ y: CGFloat) {
        internalView.addOperation(.translate(x, y))
    }
}