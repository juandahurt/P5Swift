//
//  P5Sketch.swift
//  
//
//  Created by Juan Hurtado on 14/06/23.
//

import UIKit

open class P5Sketch {
    private var internalView: P5SketchInternalView
    
    /// This is used only in the demo app to identify each example. So you can ignore this.
    public var title: String?
    
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
        setup()
    }
    
    private func onInternalDraw() {
        draw()
    }
    
    /// Its called once the sketch is initialized
    open func setup() {}
    
    /// It gets called every frame. This is where you should perform draw operations.
    open func draw() {}
}

// MARK: - Structure
public extension P5Sketch {
    /// Saves the current graphics state
    func push() {
        internalView.addOperation(.push)
    }
    
    /// Restores the graphics state to the most recently saved one
    func pop() {
        internalView.addOperation(.pop)
    }
    
    /// Starts the running loop if it's stopped
    ///
    /// If you call this method and the draw loop is running, it won't have any effect
    func loop() {
        internalView.loop = true
    }
    
    /// Stops the draw loop
    func noLoop() {
        internalView.loop = false
    }
    
    /// It calls the `draw()` method one single time.
    ///
    /// Notice that it only makes sense to call this method when the draw loop is not runnig. If it gets called when the run loop
    /// is running, it won't have any effect.
    func redraw() {
        internalView.userWantsRedraw = true
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
    /// Applies a rotation transformation to the current transformation matrix using the provided angle (in radians).
    /// - Parameter angle: The angle to rotate the current transformation
    func rotate(_ angle: CGFloat) {
        internalView.addOperation(.rotate(angle))
    }
    
    /// Displaces the origin of the coordinate system.
    /// - Parameters:
    ///   - x: The translation in the x axis
    ///   - y: The translation in the x axis
    func translate(_ x: CGFloat, _ y: CGFloat) {
        internalView.addOperation(.translate(x, y))
    }
}

// MARK: - Settings
public extension P5Sketch {
    func fill(_ color: CGColor) {
        internalView.addOperation(.fill(color))
    }
}
