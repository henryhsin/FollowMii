//
//  CheckListTableViewCell.swift
//  FollowMii
//
//  Created by 辛忠翰 on 2017/7/22.
//  Copyright © 2017年 辛忠翰. All rights reserved.
//

import UIKit

class CheckListTableViewCell: UITableViewCell {

    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var weather: UIImageView!
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var time: UILabel!
    func configureCell(checkList: CheckList) {
        self.date.text = checkList.date
        self.title.text = checkList.title + " " + checkList.subtitle
        switch checkList.todayWeather {
        case .sunny : self.weather.image = UIImage(named: "sunny")
        case .rainy : self.weather.image = UIImage(named: "rainy")
        }
        
        self.time.text = checkList.time
        self.temperature.text = checkList.temperature
        self.backgroundView = UIImageView(image: UIImage(named: "\(checkList.background)"))
        self.backgroundView?.alpha = 0.7
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 8.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override var frame: CGRect{
        didSet{
            var newFrame = frame
            newFrame.origin.x += 10/2
            newFrame.size.width -= 10
            newFrame.origin.y += 10
            newFrame.size.height -= 20
            super.frame = newFrame
        }
    }

}
