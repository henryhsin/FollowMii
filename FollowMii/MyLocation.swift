
//
//  MyLocation.swift
//  FollowMii
//
//  Created by 辛忠翰 on 2017/8/25.
//  Copyright © 2017年 辛忠翰. All rights reserved.
//

import Foundation
import MapKit
class MyLocation: NSObject {
    var name: String
    var subName: String
    var longitude: NSNumber
    var latitude: NSNumber
    var location: CLLocation
    init(name: String, subName: String, longitude: NSNumber, latitude: NSNumber ) {
        self.name = name
        self.subName = subName
        self.latitude = latitude
        self.longitude = longitude
        self.location = CLLocation(latitude: CLLocationDegrees(self.latitude), longitude: CLLocationDegrees(self.longitude))
    }
}

extension MyLocation: MKAnnotation{
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
