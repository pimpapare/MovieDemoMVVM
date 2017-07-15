//
//  UIActivityIndicatorView_IBDesignable.swift
//  UIElements
//
//  Created by pimpaporn chaichompoo on 3/1/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import UIKit

@IBDesignable
class UIActivityIndicatorViewExtension: UIActivityIndicatorView {

    @IBInspectable var sizeActivityIndicator: CGFloat? = 2.0{ didSet { setSizeActivity() }}

    func setSizeActivity(){
        self.transform = CGAffineTransform(scaleX: sizeActivityIndicator!, y: sizeActivityIndicator!);
    }
    
    override func layoutIfNeeded() {
        super.layoutSubviews()
        setSizeActivity()
    }
}
