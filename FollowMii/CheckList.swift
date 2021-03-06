//
//  CheckList.swift
//  FollowMii
//
//  Created by 辛忠翰 on 2017/7/22.
//  Copyright © 2017年 辛忠翰. All rights reserved.
//

import Foundation
class CheckList: CheckListProtocol {
    typealias SomeEnumType = Weather
    var date: String = ""
    var title: String = ""
    var subtitle: String = ""
    enum Weather {
        case sunny
        case rainy
    }
    var todayWeather: Weather = .sunny
    var time: String = ""
    var temperature: String = ""
    var background: String = ""
    init(date: String, title: String, todayWeather: Weather, time: String, temperature: String, bg: String, subtitle: String) {
        self.date = date
        self.title = title
        self.todayWeather = todayWeather
        self.time = time
        self.temperature = temperature
        self.background = bg
        self.subtitle = subtitle
    }
}

protocol CheckListProtocol {
    var date: String {get set}
    var title: String {get set}
    var subtitle: String {get set}
    associatedtype SomeEnumType
    var todayWeather: SomeEnumType {get set}
    var time: String {get set}
    var temperature: String {get set}
    var background: String {get set}

}
