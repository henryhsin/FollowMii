//
//  FunCollectionViewData.swift
//  FollowMii
//
//  Created by 辛忠翰 on 2017/7/24.
//  Copyright © 2017年 辛忠翰. All rights reserved.
//

import Foundation
import MapKit

class FunCollectionViewData: NSObject{
    var name: String
    var money: Int
    var startTime: String
    var distanceTime: Float
    var photo: String
    var index: Int
    var state: String
    var subName: String
    var dataDescription: String
    var longitude: NSNumber
    var latitude: NSNumber
    var location: CLLocation
    init(name: String, money: Int, startTime: String, distanceTime: Float, photo: String, index: Int, state: String, subName: String, dataDescription:String, longitude: NSNumber, latitude: NSNumber ) {
        self.name = name
        self.money = money
        self.startTime = startTime
        self.distanceTime = distanceTime
        self.photo = photo
        self.index = index
        self.state = state
        self.dataDescription = dataDescription
        self.subName = subName
        self.latitude = latitude
        self.longitude = longitude
        self.location = CLLocation(latitude: CLLocationDegrees(self.latitude), longitude: CLLocationDegrees(self.longitude))
    }
}

extension FunCollectionViewData: MKAnnotation{
    var coordinate: CLLocationCoordinate2D{
        get {
            return location.coordinate
        }
    }
    
    var title: String?{
        get{
            return name
        }
    }
    
    var subtitle: String?{
        get{
            return subName
        }
    }
    
    
}


