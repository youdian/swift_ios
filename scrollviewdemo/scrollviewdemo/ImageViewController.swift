//
//  ImageViewController.swift
//  scrollviewdemo
//
//  Created by 周周 on 15/12/1.
//  Copyright © 2015年 youdian.org. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
        let pop = PopAnimator()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func presentImageViewer(sender: UITapGestureRecognizer) {
//        frameAnimation()
        let imageViewerController = storyboard?.instantiateViewControllerWithIdentifier("ImageViewerController") as! ImageViewerController
        imageViewerController.image = imageView.image
        imageViewerController.transitioningDelegate = self
        self
        presentViewController(imageViewerController, animated: true, completion: nil)
    }

    func frameAnimation() {
        UIView.animateWithDuration(3, animations: {
            self.imageView.frame = self.view.frame
        })
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

extension ImageViewController: UIViewControllerTransitioningDelegate {

    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {

        
        pop.presenting = false
        return pop
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        pop.presenting = true
        pop.originalFrame = self.imageView.superview!.convertRect(self.imageView.frame, toView: nil)
        pop.animatedView = self.imageView
        return pop
    }
}

class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    var presenting: Bool = true
    var originalFrame = CGRect.zero
    var animatedView : UIView!
    let duration: NSTimeInterval = 1
     func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return duration
    }
     func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView()
        let viewerController = (presenting ? transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) : transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)) as! ImageViewerController
        let viewerView = viewerController.imageView
        let viewerFrame = viewerView.frame
        print("viewerView frame \(viewerView.frame)")
        containerView?.addSubview(viewerController.view)
        if presenting {
            viewerView.frame = originalFrame
            UIView.animateWithDuration(duration, animations: {
                viewerView.frame = viewerFrame
                }, completion: {_ in
                    transitionContext.completeTransition(true)
            })
        } else {
            animatedView.frame = viewerFrame
            UIView.animateWithDuration(duration, animations: {
                self.animatedView.frame = self.originalFrame
                }, completion: {_ in
                    transitionContext.completeTransition(true)
            })
        }
    }
}