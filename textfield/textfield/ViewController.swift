//
//  ViewController.swift
//  textfield
//
//  Created by 周周 on 15/8/3.
//  Copyright (c) 2015年 youdian.org. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var phonenumber: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var lastInput: UITextField!
    var moved = false
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomTextField.layer.borderWidth = 0.5
        bottomTextField.layer.cornerRadius = 8
        bottomTextField.layer.masksToBounds = true
        bottomTextField.layer.borderColor = UIColor.redColor().CGColor
        bottomTextField.delegate = self
        
    }
    
    func registerKeyboardNotification() {
        print("register notification...")
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("handleKeyboardEvent:"), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("handleKeyboardEvent:"), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func cancelNotification() {
        print("cancel notification")
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func handleKeyboardEvent(notification: NSNotification) {
        let name = notification.name
        let userInfo = notification.userInfo
        print(userInfo)
        if name == UIKeyboardWillShowNotification {
            let rect: CGRect? = userInfo![UIKeyboardFrameEndUserInfoKey]?.CGRectValue
            var keyboardY: CGFloat = 0
            if let rect = rect {
                keyboardY = rect.origin.y
            }
            for child in view.subviews {
                if child.isKindOfClass(UITextField) && child.isFirstResponder(){
                    let originY = child.frame.origin.y
                    let height = child.frame.height
                    let distance = originY + height - keyboardY
                    if distance > 0 {
                        self.view.transform = CGAffineTransformMakeTranslation(0, -distance)
                        moved = true
                    }
                }
            }
        } else if name == UIKeyboardWillHideNotification {
            if moved {
                self.view.transform = CGAffineTransformMakeTranslation(0, 0)
                moved = false
            }
        }
    }
    override func viewDidAppear(animated: Bool) {
        registerKeyboardNotification()
    }
    override func viewDidDisappear(animated: Bool) {
        cancelNotification()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first!
        if #available(iOS 9.0, *) {
            touch.type
        } else {
            // Fallback on earlier versions
        }
        bottomTextField.resignFirstResponder()
        lastInput.resignFirstResponder()
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing")
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        print("textFieldDidBeginEditing")
    }
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        print("textFieldShouldBeginEditing")
        return true
    }
    func textFieldDidEndEditing(textField: UITextField) {
        print("textFieldDidEndEditing")
    }
    
    func textFieldShouldClear(textField: UITextField) -> Bool {
        print("textFieldShouldClear")
        return true
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        textField.resignFirstResponder()
        return true
    }
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        print("textFieldShouldChangeCharactersInRange\(range), replamentString:\(string)")
        return true
    }
    
    @IBAction func unwindToThisViewController(segue: UIStoryboardSegue) {
        print(segue)
    }

}

