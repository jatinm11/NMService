//
//  JAMViews.swift
//  NMService
//
//  Created by Jatin Menghani on 03/04/21.
//

import UIKit

class JAMBorderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        layer.borderWidth = 0.4
        layer.cornerRadius = 10
        layer.borderColor = UIColor.lightGray.cgColor
    }
}
