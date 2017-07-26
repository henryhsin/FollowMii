//
//  GradiantView.swift
//  FollowMii
//
//  Created by 辛忠翰 on 2017/7/25.
//  Copyright © 2017年 辛忠翰. All rights reserved.
//

import UIKit

class GradiantView: UIView {

    lazy var gradientLayer: CAGradientLayer = {
       let layer = CAGradientLayer()
        layer.colors = [UIColor.clear.cgColor, UIColor(white: 0.0, alpha: 0.75).cgColor]
        layer.locations = [0.0, 1.0]
        return layer
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.clear
        layer.addSublayer(gradientLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
}
