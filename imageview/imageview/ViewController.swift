//
//  ViewController.swift
//  imageview
//
//  Created by 周周 on 15/8/4.
//  Copyright (c) 2015年 youdian.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var sampleImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func copyMe(sender: UIButton) {
        println("copy me")
        imageView.image = imageFromUIView(sampleImageView)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imageFromUIView(view: UIView) -> UIImage {
        let size = view.bounds.size
        UIGraphicsBeginImageContext(size)
        let context: CGContextRef = UIGraphicsGetCurrentContext()
//        view.drawLayer(view.layer, inContext: context)
        view.drawViewHierarchyInRect(view.bounds, afterScreenUpdates: false)
        var image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
        
    }


}

