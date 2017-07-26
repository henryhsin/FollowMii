//
//  FunCollectionViewCell.swift
//  FollowMii
//
//  Created by 辛忠翰 on 2017/7/22.
//  Copyright © 2017年 辛忠翰. All rights reserved.
//

import UIKit

class FunCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var photoImgView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    func configureCell(data: FunCollectionViewData?) {
        guard let data = data else {return}
        photoImgView.image = UIImage(named:"\(data.photo)")
        titleLabel.text = "\(data.title)"
        priceLabel.text = "NTD\(data.money)"
        timeLabel.text = "\(data.startTime)   @\(data.distanceTime) hr"
    }
}
