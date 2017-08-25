//
//  MapViewController.swift
//  FollowMii
//
//  Created by 辛忠翰 on 2017/8/24.
//  Copyright © 2017年 辛忠翰. All rights reserved.
//

import UIKit
import MapKit
class MapViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    var locationManager: CLLocationManager?
    var startLocation: CLLocation?
    var testLocation: FunCollectionViewData?
    var location: CLLocation?
//    var geCoder: CLGeocoder?
    
    var monitorLoction: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.requestWhenInUseAuthorization()
//        locationManager?.requestAlwaysAuthorization()
        let collectionViewDataSource = FunCollectionDataSources.init()
        testLocation = collectionViewDataSource.immutableDatas[0]
        location = CLLocation(latitude: testLocation?.latitude as! CLLocationDegrees, longitude: testLocation?.longitude as! CLLocationDegrees)
        
        let regionRadius: CLLocationDistance = 1000.0
        let region = MKCoordinateRegionMakeWithDistance((location?.coordinate)!, regionRadius, regionRadius)
        mapView.setRegion(region, animated: true)
        mapView.delegate = self as? MKMapViewDelegate
        //將經緯度轉換為地址
        /*geCoder = CLGeocoder()
        geCoder?.reverseGeocodeLocation(location!){ [weak self] (placemarks, error) in
            let placemark = placemarks?.first
            let streetNumber = placemark?.subThoroughfare
            let street = placemark?.thoroughfare
            let city = placemark?.locality
            let state = placemark?.administrativeArea
            let addr = "\(streetNumber) \(street) \(city) \(state)"
            print("addr = \(addr)")
        }
        */
        
        //region會用到
        /*
        monitorLoction = CLLocation(latitude: 37.331600000000002, longitude: -122.0301)
        
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension MapViewController: MKMapViewDelegate{
    func mapViewWillStartRenderingMap(_ mapView: MKMapView) {
        print("randering")
    }
}


extension MapViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if startLocation == nil{
            startLocation = locations.first
        }else{
            guard let location = location else {return}
            if let metersFromLocation = startLocation?.distance(from: location){
                let miles = Int((metersFromLocation/1000) * 0.62137) 
                print("miles: \(miles)")
            }
            
            
//            guard let latestLocation = locations.first else {return}
//            let distanceInMeters = startLocation?.distance(from: latestLocation)
//            print("distance in meters = \(String(describing: distanceInMeters))")
        }
    }
    
    //當取得使用者授權時
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse || status == .authorizedAlways{
//            locationManager?.startUpdatingLocation()
//            //再background可以繼續取得座標
//            locationManager?.allowsBackgroundLocationUpdates = true
            
            //需implement didFailWithError delegate
            locationManager?.requestLocation()
            
            //region
            /*
            if CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self){
                let region = CLCircularRegion(center: (monitorLoction?.coordinate)!, radius: 300, identifier: "Apple HQ")
                region.notifyOnEntry = true
                locationManager?.startMonitoring(for: region)
            }
            locationManager?.startUpdatingLocation()
            
            */
        }
    }
    
    //region
    /*
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("Enter region")
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("Exit region")
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error")
    }
    
    func locationManager(_ manager: CLLocationManager, monitoringDidFailFor region: CLRegion?, withError error: Error) {
        print("region error")
    }
 */
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error")
    }
}
