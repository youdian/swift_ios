//
//  ViewController.swift
//  baidumap
//
//  Created by 周周 on 15/8/7.
//  Copyright (c) 2015年 youdian.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var mapView: BMKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView = BMKMapView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        self.view.addSubview(mapView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

