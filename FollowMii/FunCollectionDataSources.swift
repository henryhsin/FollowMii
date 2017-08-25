//
//  FunCollectionDataSources.swift
//  FollowMii
//
//  Created by 辛忠翰 on 2017/7/24.
//  Copyright © 2017年 辛忠翰. All rights reserved.
//

import Foundation
class FunCollectionDataSources: FunCollectionDataSourcesProtocol {
    
    var datas: [FunCollectionViewData] = []
    var immutableDatas: [FunCollectionViewData] = []
    var sections: [String] = []
    var count: Int{
        return datas.count
    }
    var numberOfSection: Int{
        return sections.count
    }
    
    init() {
        datas = loadDatasFromDisk()
        immutableDatas = datas
    }
    internal func loadDatasFromDisk() -> [FunCollectionViewData] {
        sections.removeAll(keepingCapacity: false)
        if let path = Bundle.main.path(forResource: "FunCollectionViewDatas", ofType: "plist"){
            if let dictArray = NSArray(contentsOfFile: path){
                var datas: [FunCollectionViewData] = []
                for item in dictArray{
                    if let dict = item as? NSDictionary{
                        if let title = dict["title"] as? String,
                            let startTime = dict["startTime"] as? String,
                            let photo = dict["photo"] as? String,
                            let money = dict["money"] as? Int,
                            let distanceTime = dict["distanceTime"] as? Float,
                            let index = dict["index"] as? Int,
                            let state = dict["state"] as? String,
                            let description = dict["description"] as? String,
                            let subtitle = dict["subtitle"] as? String,
                            let longitude = dict["longitude"] as? NSNumber,
                            let latitude = dict["latitude"] as? NSNumber{
                            let data = FunCollectionViewData.init(name: title, money: money, startTime: startTime, distanceTime: distanceTime, photo: photo, index: index, state: state, subName: subtitle, dataDescription: description, longitude: longitude, latitude: latitude)
                            if !sections.contains(state){
                                sections.append(state)
                            }
                            datas.append(data)
                        }
                        
                    }
                }
                return datas
            }
        }
        return []
    }
    
    internal func datasForSection(index: Int) -> [FunCollectionViewData]{
        let section = sections[index]
        let datasInSection = datas.filter { (data: FunCollectionViewData) -> Bool in
            return data.state == section
        }
        return datasInSection
    }
    
    func numberOfDatasInSections(index: Int) -> Int{
        let datas = datasForSection(index: index)
        return datas.count
    }
    
    //找到indexPath的絕對路徑(數目= 經過section個數+這個section底下的item個數)
    internal func absoluteIndexForIndexPath(indexPath: IndexPath) -> Int{
        var index = 0
        for i in 0 ..< indexPath.section {
            index += numberOfDatasInSections(index: i)
        }
        index += indexPath.item
        return index
    }
    
    
    func deleteItemAtIndexPaths(indexPaths: [IndexPath]) {
        //indexes中為欲刪資料
        var indexes: [Int] = []
        for indexPath in indexPaths{
            indexes.append(absoluteIndexForIndexPath(indexPath: indexPath))
        }
        //創建一個空的array，一一比對indexes與原先data，只要不相同及加到我們的新array，最後此array及為我們的刪後array
        var newDatas: [FunCollectionViewData] = []
        for (index, data) in datas.enumerated(){
            if !indexes.contains(index){
                newDatas.append(data)
            }
        }
        datas = newDatas
    }
    
    //傳入data，尋找他的indexPath
    func indexPathForData(data: FunCollectionViewData) -> IndexPath{
        let section = sections.index(of: data.state)!
        var item = 0
        for (index, currentData) in datasForSection(index: section).enumerated(){
            if currentData === data{
                item = index
                break
            }
        }
        return IndexPath(item: item, section: section)
    }
    
    //用index來找data，其中若indexPath.section<0則直接找datas[indexPath.item],若>0，則須先call datasForSection找到一個擁有在indexPath.section前的所有datas array，再從這個datas找出datas[indexPath.item]即為所求
    /*
     section0,.item0       section1,.item5       section2,.item9
     data1,.item1          data5,.item6          data8,.item10
     data2,.item2          data6,.item7          data9,.item11
     data3,.item3          data7,.item8
     data4,.item4
     */
    func dataForItemAtIndexPath(indexPath: IndexPath) -> FunCollectionViewData? {
        if indexPath.section > 0{
            let datas = datasForSection(index: indexPath.section)
            return datas[indexPath.item]
        }else{
            return datas[indexPath.item]
        }
    }
    
    func titleForSectionAtIndexPath(indexPath: IndexPath) -> String? {
        if indexPath.section < sections.count{
            return sections[indexPath.section]
        }
        return nil
    }
}

protocol FunCollectionDataSourcesProtocol{
    var datas: [FunCollectionViewData] {get set}
    var immutableDatas: [FunCollectionViewData] {get set}
    var sections: [String] {get set}
    var count: Int {get}
    var numberOfSection: Int {get}
    func loadDatasFromDisk() -> [FunCollectionViewData]
    func datasForSection(index: Int) -> [FunCollectionViewData]
    func numberOfDatasInSections(index: Int) -> Int
    func absoluteIndexForIndexPath(indexPath: IndexPath) -> Int
    func deleteItemAtIndexPaths(indexPaths: [IndexPath])
    func indexPathForData(data: FunCollectionViewData) -> IndexPath
    func dataForItemAtIndexPath(indexPath: IndexPath) -> FunCollectionViewData?
    func titleForSectionAtIndexPath(indexPath: IndexPath) -> String?
}
