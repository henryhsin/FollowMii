//
//  CheckLists.swift
//  FollowMii
//
//  Created by 辛忠翰 on 2017/7/22.
//  Copyright © 2017年 辛忠翰. All rights reserved.
//

import Foundation
class CheckLists{
    var checkLists = [CheckList]()
    let checkList1 = CheckList.init(date: "2017/7/24", title: "JuiFen", todayWeather: .rainy, time: "20:00", temperature: "30˚C/ 33˚C", bg: "photo1", subtitle: "Hello World")
    let checkList2 = CheckList.init(date: "2017/7/23", title: "Tainan", todayWeather: .rainy, time: "18:20", temperature: "30˚C/ 33˚C", bg: "photo2", subtitle: "Hello World")
    let checkList3 = CheckList.init(date: "2017/7/22", title: "Annpin", todayWeather: .rainy, time: "16:05", temperature: "30˚C/ 33˚C", bg: "photo3", subtitle: "Hello World")
    let checkList4 = CheckList.init(date: "2017/7/22", title: "Hsin ", todayWeather: .rainy, time: "15:11", temperature: "30˚C/ 33˚C", bg: "photo4", subtitle: "Hello World")
    let checkList5 = CheckList.init(date: "2017/7/20", title: "JuiFen", todayWeather: .rainy, time: "11:03", temperature: "30˚C/ 33˚C", bg: "photo5", subtitle: "Hello World")
    init() {
        checkLists.append(checkList1)
        checkLists.append(checkList2)
        checkLists.append(checkList3)
        checkLists.append(checkList4)
        checkLists.append(checkList5)
    }
    func addNewList(checkList: CheckList) {
        checkLists.append(checkList)
    }
}
