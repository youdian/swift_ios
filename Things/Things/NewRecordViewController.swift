//
//  NewRecordViewController.swift
//  Things
//
//  Created by 周周 on 15/11/18.
//  Copyright © 2015年 youdian.org. All rights reserved.
//

import UIKit
import Foundation

class NewRecordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("appEnterBackground:"), name: UIApplicationDidEnterBackgroundNotification, object: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func appEnterBackground(notification: NSNotification) {
        print("receive notification:\(notification.name)")
        NSNotificationCenter.defaultCenter().removeObserver(self)
        self.presentedViewController?.dismissViewControllerAnimated(false, completion: nil)
    }
    
    @IBAction func showSelectPictureDialog(sender: UIButton) {
        let alertController = UIAlertController(title: "添加图片", message: "", preferredStyle: .ActionSheet)
        let popOver = alertController.popoverPresentationController
        if popOver != nil {
            popOver?.sourceView = sender
            popOver?.sourceRect = sender.bounds
            popOver?.permittedArrowDirections = .Any
        }
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
        let cameraAction = UIAlertAction(title: "拍照", style: UIAlertActionStyle.Default, handler: {action in
            self.selectPicture(.Camera)
        })
        let albumAction = UIAlertAction(title: "从相册选择", style: .Default, handler: {action in
            print("select from album")
            self.selectPicture(.SavedPhotosAlbum)
        })
        let libraryAction = UIAlertAction(title: "从图片库选择", style: .Default, handler: {action in
            self.selectPicture(.PhotoLibrary)
        })
        alertController.addAction(cancelAction)
        alertController.addAction(cameraAction)
        alertController.addAction(albumAction)
        alertController.addAction(libraryAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func selectPicture(sourceType: UIImagePickerControllerSourceType) {
        let pickController = UIImagePickerController()
        pickController.sourceType = sourceType
        pickController.delegate = self
        pickController.allowsEditing = true
        presentViewController(pickController, animated: true, completion: nil)
    }

}

extension NewRecordViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        picker.dismissViewControllerAnimated(true, completion: nil)
        let contentType = info[UIImagePickerControllerMediaType] as! CFString
        let image = info[UIImagePickerControllerOriginalImage]
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
}