//
//  ViewController.swift
//  baidumap
//
//  Created by 周周 on 15/8/7.
//  Copyright (c) 2015年 youdian.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController, BMKLocationServiceDelegate, BMKGeoCodeSearchDelegate, BMKMapViewDelegate {
    var mapView: BMKMapView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var locationText: UITextField!
    @IBOutlet weak var addressText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        //适配iOS7
        let systemVersion = (UIDevice.currentDevice().systemVersion as NSString).doubleValue
        if systemVersion >= 7.0 {
            self.navigationController?.navigationBar.translucent = false
        }
        let scrollViewHeight = scrollView.frame.height + scrollView.frame.origin.y
        mapView = BMKMapView(frame: CGRect(x: 0, y: scrollViewHeight, width: self.view.bounds.width, height: self.view.frame.height - scrollViewHeight))
        mapView.buildingsEnabled = true
        mapView.showsUserLocation = true
        mapView.delegate = self
        self.view.addSubview(mapView)
        stepper.value = Double(mapView.zoomLevel)
        stepper.maximumValue = 20
        stepper.minimumValue = 3
        stepper.stepValue = 1.0
        stepper.addTarget(self, action: "valueChanged:", forControlEvents: UIControlEvents.ValueChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func findMyLocation(sender: UIButton) {
        let locationService = BMKLocationService()
        locationService.startUserLocationService()
        locationService.delegate = self
    }
    
    @IBAction func geoCode(sender: UIButton) {
        let city = locationText.text
        let address = addressText.text
        let geoOption = BMKGeoCodeSearchOption()
        geoOption.address = address
        geoOption.city = city
        let geoCodeSearch = BMKGeoCodeSearch()
        geoCodeSearch.delegate = self
        geoCodeSearch.geoCode(geoOption)
    }
    func onGetGeoCodeResult(searcher: BMKGeoCodeSearch!, result: BMKGeoCodeResult!, errorCode error: BMKSearchErrorCode) {
        let coordinate = result.location
        let address = result.address
        println("geo code result , latitude=\(coordinate.latitude), longitude=\(coordinate.longitude)")
        println("geo code result, address = \(address)")
    }
    func onGetReverseGeoCodeResult(searcher: BMKGeoCodeSearch!, result: BMKReverseGeoCodeResult!, errorCode error: BMKSearchErrorCode) {
        
    }
    
    func didUpdateBMKUserLocation(userLocation: BMKUserLocation!) {
        let location: CLLocation = userLocation.location
        let coordinate = location.coordinate
        let latitude = coordinate.latitude
        let longitude = coordinate.longitude
        println("my location: latitude=\(latitude), longtitude=\(longitude)")
    }
    
    func didFailToLocateUserWithError(error: NSError!) {
        println("canot locate , error= \(error.description)")
    }

    
    func valueChanged(sender: UIStepper) {
        let value = sender.value
        println("value changed: \(value)")
        mapView.zoomLevel = Float(value)
    }
    
    func mapView(mapView: BMKMapView!, onClickedMapBlank coordinate: CLLocationCoordinate2D) {
        let longitude = coordinate.longitude
        let latitude = coordinate.latitude
        mapView.centerCoordinate = coordinate // center the map to coordinate
        let annotation = BMKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "title"
                
        mapView.addAnnotation(annotation)
    }
    
    func mapView(mapView: BMKMapView!, viewForAnnotation annotation: BMKAnnotation!) -> BMKAnnotationView! {
        let annotationView = BMKPinAnnotationView(annotation: annotation, reuseIdentifier: "annotation")
        annotationView.animatesDrop = true
        return annotationView
    }
    
    func mapView(mapView: BMKMapView!, didSelectAnnotationView view: BMKAnnotationView!) {
        println("select annotation view")
    }


}

