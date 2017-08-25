//
//  FunMapViewController.swift
//  FollowMii
//
//  Created by 辛忠翰 on 2017/8/25.
//  Copyright © 2017年 辛忠翰. All rights reserved.
//

import UIKit
import MapKit
class FunMapViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    var destLocation: CLLocation?
    var myLocation: CLLocation?
    var myRealLocation: MyLocation?
    var FunDestination: FunCollectionViewData?
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self as? MKMapViewDelegate
        locationManager.delegate = self as? CLLocationManagerDelegate
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        loadData()
        let regionRadius: CLLocationDistance = 2000
        let region = MKCoordinateRegionMakeWithDistance((destLocation?.coordinate)!, regionRadius, regionRadius)
        mapView.setRegion(region, animated: true)
        mapView.mapType = .standard
        mapView.isRotateEnabled = false
        mapView.addAnnotation(FunDestination!)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func loadData() {
        let collectionViewDataSource = FunCollectionDataSources.init()
        FunDestination = collectionViewDataSource.immutableDatas[0]
        destLocation = FunDestination?.location
    }
    
    func updateMapView() {
        guard let sourceLoction =  myRealLocation else {
            return
        }
        let sourcePlacemark = MKPlacemark(coordinate: (sourceLoction.coordinate), addressDictionary: nil)
        let destPlaceMark = MKPlacemark(coordinate: (destLocation?.coordinate)!, addressDictionary: nil)
        let request = MKDirectionsRequest()
        request.source = MKMapItem(placemark: sourcePlacemark)
        request.destination = MKMapItem(placemark: destPlaceMark)
        request.requestsAlternateRoutes = false
        request.transportType = .automobile
        
        let direction = MKDirections(request: request)
        direction.calculate { [weak self] (response, error) in
            if error == nil{
                for route in (response?.routes)!{
                    self?.mapView.add(route.polyline)
                }
            }
        }
    }
}

extension FunMapViewController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "anno") as? MKPinAnnotationView
        if annotationView == nil{
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "anno")
        }else{
            annotationView?.annotation = annotation
        }
        
        annotationView?.pinTintColor = UIColor.orange
        annotationView?.canShowCallout = true
        if let place = annotation as? FunCollectionViewData{
            annotationView?.detailCalloutAccessoryView = UIImageView(image: UIImage(named: place.photo))
        }
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.blue
        renderer.lineWidth = 3.0
        return renderer
    }
}

extension FunMapViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse || status == .authorizedAlways{
            locationManager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        myLocation = locations.first
        print("My Location: \(myLocation?.coordinate)")
        myRealLocation = MyLocation.init(name: "I am here", subName: "Hi~~", longitude: myLocation?.coordinate.longitude as! NSNumber, latitude: myLocation?.coordinate.latitude as! NSNumber)
        updateMapView()
        if myLocation == nil{
            
        }else{
            guard myLocation != nil else {
                return
            }
            
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location Error!!")
    }
}
