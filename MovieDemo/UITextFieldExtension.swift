//
//  UITextField_IBDesignable.swift
//  UIElements
//
//  Created by pimpaporn chaichompoo on 2/27/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import UIKit

@IBDesignable
class UITextFieldExtension: UITextField {
    
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
    
    @IBInspectable var placeHolderColor: UIColor? = UIColor.gray{ didSet { setPlaceHolderColor() }}
    
    func setPlaceHolderColor(){
        let str = NSAttributedString(string: placeholder!, attributes: [NSForegroundColorAttributeName:placeHolderColor! as UIColor])
        self.attributedPlaceholder = str
    }
    
    @IBInspectable var insetPadding: CGFloat = 0
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: insetPadding, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
    
}
