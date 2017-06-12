//
//  EmptyView.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 6/5/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import UIKit
import EZSwiftExtensions

protocol EmptyViewDelegate: class {
    func didReload()
}

class EmptyView: UIView {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var descLabel: UILabel!
    weak var delegate: EmptyViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        button.addTarget(self, action: #selector(tapReload), for: .touchUpInside)
    }
    
    func tapReload() {
        self.delegate?.didReload()
    }
}
