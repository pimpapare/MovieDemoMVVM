//
//  UIView_IBDesignable.swift
//  UIElements
//
//  Created by pimpaporn chaichompoo on 2/27/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import UIKit

@IBDesignable
class UIViewExtension: UIView {
    
    //ref. https://github.com/rpzzzzzz/IBDesignableView
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            if let cgColor = layer.borderColor {
                return UIColor(cgColor: cgColor)
            } else { return .none }
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    //ref. http://stackoverflow.com/questions/24380535/how-to-apply-gradient-to-background-view-of-ios-swift-app
    @IBInspectable var shadowRadius: CGFloat = 2.0{ didSet { addShadow() }}
    @IBInspectable var shadowOpacity: Float = 1{ didSet { addShadow() }}
    @IBInspectable var shadowColor: UIColor = UIColor.black{ didSet { addShadow() }}
    
    func addShadow(){
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowRadius = shadowRadius
        layer.shadowColor = shadowColor.cgColor
    }
    
    @IBInspectable var startColor:   UIColor = .black { didSet { updateColors() }}
    @IBInspectable var endColor:     UIColor = .white { didSet { updateColors() }}
    @IBInspectable var startLocation: Double =   0.05 { didSet { updateLocations() }}
    @IBInspectable var endLocation:   Double =   0.95 { didSet { updateLocations() }}
    @IBInspectable var horizontalMode:  Bool =  false { didSet { updatePoints() }}
    @IBInspectable var diagonalMode:    Bool =  false { didSet { updatePoints() }}
    
    override class var layerClass: AnyClass { return CAGradientLayer.self }
    
    var gradientLayer: CAGradientLayer { return layer as! CAGradientLayer }
    
    func updatePoints() {
        if horizontalMode {
            gradientLayer.startPoint = diagonalMode ? CGPoint(x: 1, y: 0) : CGPoint(x: 0, y: 0.5)
            gradientLayer.endPoint   = diagonalMode ? CGPoint(x: 0, y: 1) : CGPoint(x: 1, y: 0.5)
        } else {
            gradientLayer.startPoint = diagonalMode ? CGPoint(x: 0, y: 0) : CGPoint(x: 0.5, y: 0)
            gradientLayer.endPoint   = diagonalMode ? CGPoint(x: 1, y: 1) : CGPoint(x: 0.5, y: 1)
        }
    }
    func updateLocations() {
        gradientLayer.locations = [startLocation as NSNumber, endLocation as NSNumber]
    }
    func updateColors() {
        gradientLayer.colors    = [startColor.cgColor, endColor.cgColor]
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updatePoints()
        updateLocations()
        updateColors()
    }
}
