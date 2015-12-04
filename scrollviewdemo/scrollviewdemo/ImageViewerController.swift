//
//  ImageViewerController.swift
//  scrollviewdemo
//
//  Created by 周周 on 15/11/30.
//  Copyright © 2015年 youdian.org. All rights reserved.
//

import UIKit

class ImageViewerController: UIViewController {
    var imageView: UIImageView!
    var image: UIImage?
    var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = UIImageView(frame: self.view.bounds)
        imageView.contentMode = .ScaleAspectFill
        imageView.backgroundColor = UIColor.clearColor()
        imageView.clipsToBounds =  true
        if let image = image {
            imageView.image = image
        }
        view.addSubview(imageView)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "onTap:")
        imageView.userInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func onTap(gestureRecognizer: UITapGestureRecognizer) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ImageViewerController: UIScrollViewDelegate {
    func scrollViewDidEndZooming(scrollView: UIScrollView, withView view: UIView?, atScale scale: CGFloat) {
        
    }
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
        imageView.center = scrollView.center
    }
    
    func scrollViewWillBeginZooming(scrollView: UIScrollView, withView view: UIView?) {
        
    }
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
