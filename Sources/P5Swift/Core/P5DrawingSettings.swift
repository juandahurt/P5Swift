//
//  P5DrawingSettings.swift
//
//
//  Created by Juan Hurtado on 17/06/23.
//

import UIKit
import CoreGraphics

class P5DrawingSettings {
    static let instance: P5DrawingSettings = P5DrawingSettings()
    
    var fillColor: CGColor = UIColor.black.cgColor
    var strokeColor: CGColor = UIColor.clear.cgColor
}
