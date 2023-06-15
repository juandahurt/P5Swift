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
    /// <#Description#>
    /// - Parameter bgColor: <#bgColor description#>
    func background(_ bgColor: CGColor) {
        internalView.addOperation(.background(bgColor))
    }
    
    /// <#Description#>
    /// - Parameters:
    ///   - x1: <#x1 description#>
    ///   - y1: <#y1 description#>
    ///   - x2: <#x2 description#>
    ///   - y2: <#y2 description#>
    func line(_ x1: CGFloat, _ y1: CGFloat, _ x2: CGFloat, _ y2: CGFloat) {
        internalView.addOperation(.line(x1, y1, x2, y2))
    }
}
