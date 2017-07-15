//
//  UIButton_IBDesignable.swift
//  UIElements
//
//  Created by pimpaporn chaichompoo on 2/27/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import UIKit

@IBDesignable
class UIButtonExtension: UIButton {
    
    @IBInspectable var colorBorder: UIColor? = UIColor.clear{ didSet { setBorder() }}
    @IBInspectable var borderWidth: CGFloat? = 1{ didSet { setBorder() }}
    
    func setBorder(){
        self.layer.borderWidth = borderWidth!
        self.layer.borderColor = colorBorder?.cgColor
    }
    
    override func layoutIfNeeded() {
        super.layoutSubviews()
        setBorder()
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}

extension UIButton{
    
    func loadingIndicator(show: Bool) {
        let tag = 9876
        if show {
            self.alpha = 0.6
            self.isUserInteractionEnabled = false
            self.tintColor = UIColor.init(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.6)
            //setTitleColor(UIColorFromRGB("F21B3F"), forState: .Normal)
            let indicator = UIActivityIndicatorView()
            let buttonHeight = self.bounds.size.height
            let buttonWidth = self.bounds.size.width
            indicator.center = CGPoint(x:buttonWidth - 30, y:buttonHeight/2)
            indicator.tag = tag
            self.addSubview(indicator)
            indicator.startAnimating()
        } else {
            self.alpha = 1
            self.isUserInteractionEnabled = true
            if let indicator = self.viewWithTag(tag) as? UIActivityIndicatorView {
                indicator.stopAnimating()
                indicator.removeFromSuperview()
            }
        }
    }
}
