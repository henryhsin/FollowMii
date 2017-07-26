//
//  FunCollectionViewData.swift
//  FollowMii
//
//  Created by 辛忠翰 on 2017/7/24.
//  Copyright © 2017年 辛忠翰. All rights reserved.
//

import Foundation
class FunCollectionViewData{
    var title: String
    var money: Int
    var startTime: String
    var distanceTime: Float
    var photo: String
    var index: Int
    var state: String
    var subtitle: String
    var description: String
    init(title: String, money: Int, startTime: String, distanceTime: Float, photo: String, index: Int, state: String, subtitle: String, description:String ) {
        self.title = title
        self.money = money
        self.startTime = startTime
        self.distanceTime = distanceTime
        self.photo = photo
        self.index = index
        self.state = state
        self.description = description
        self.subtitle = subtitle
    }
}
