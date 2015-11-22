//
//  NewRecordViewController.swift
//  Things
//
//  Created by 周周 on 15/11/18.
//  Copyright © 2015年 youdian.org. All rights reserved.
//

import UIKit
import MobileCoreServices

class NewRecordViewController: UIViewController {

    @IBOutlet weak var photoCollectionView: UICollectionView!
    var photos = [UIImage(named: "Launch")]
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("appEnterBackground:"), name: UIApplicationDidEnterBackgroundNotification, object: nil)
        photoCollectionView.dataSource = self
        photoCollectionView.delegate = self
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
    
    @IBAction func showSelectPictureDialog(sender: UIView) {
        let alertController = UIAlertController(title: "添加图片", message: "", preferredStyle: .ActionSheet)
        let popOver = alertController.popoverPresentationController
        if popOver != nil {
            popOver?.sourceView = sender
            popOver?.sourceRect = sender.bounds
            popOver?.permittedArrowDirections = .Any
        }
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            let cameraAction = UIAlertAction(title: "拍照", style: UIAlertActionStyle.Default, handler: {action in
                self.selectPicture(.Camera)
            })
                alertController.addAction(cameraAction)
        }
        if UIImagePickerController.isSourceTypeAvailable(.SavedPhotosAlbum) {
            let albumAction = UIAlertAction(title: "从相册选择", style: .Default, handler: {action in
                print("select from album")
                self.selectPicture(.SavedPhotosAlbum)
            })
                    alertController.addAction(albumAction)
        }
        if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) {
            let libraryAction = UIAlertAction(title: "从图库选择", style: .Default, handler: {action in
                self.selectPicture(.PhotoLibrary)
            })
            alertController.addAction(libraryAction)
        }
        alertController.addAction(cancelAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func selectPicture(sourceType: UIImagePickerControllerSourceType) {
        let pickController = UIImagePickerController()
        pickController.sourceType = sourceType
        pickController.delegate = self
        pickController.allowsEditing = false
        presentViewController(pickController, animated: true, completion: nil)
    }

}

extension NewRecordViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let identifier = "photo_cell"
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as! PhotoListCell
        let bgView = UIView(frame: cell.bounds)
        bgView.backgroundColor = UIColor.yellowColor()
        cell.selectedBackgroundView = bgView
        cell.backgroundView = UIView()
        let image = self.photos[indexPath.row]
        cell.image.image = image
        return cell
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.deselectItemAtIndexPath(indexPath, animated: false)
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! PhotoListCell
        print(cell.bounds)
        if indexPath.row == photos.count - 1 {
            showSelectPictureDialog(cell)
        }
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(80, 80)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 10
    }
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            let view = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "photo_collection_header", forIndexPath: indexPath) as! PhotoSupplementaryView
            view.headerLabel.text = "图片"
            return view
        }
        return UICollectionReusableView(frame: CGRect.zero)

    }
    
}

extension NewRecordViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        picker.dismissViewControllerAnimated(true, completion: nil)
        let contentType = info[UIImagePickerControllerMediaType] as! CFString
        if contentType == kUTTypeImage {
            let image = info[UIImagePickerControllerOriginalImage] as! UIImage
            photos.insert(image, atIndex: photos.count - 1)
            photoCollectionView.reloadData()
        }
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
}