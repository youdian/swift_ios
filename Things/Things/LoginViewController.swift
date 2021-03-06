//
//  LoginViewController.swift
//  Things
//
//  Created by 周周 on 15/11/24.
//  Copyright © 2015年 youdian.org. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameInput.delegate = self
        passwordInput.delegate = self

    }

    @IBAction func login(sender: UIButton) {
        let username = usernameInput.text
        let password = passwordInput.text
        
        guard username != nil && !username!.isEmpty else {
            let alert = UIAlertController.simpleAlertWithTitle("提示", andMessage: "用户名不能为空")
            presentViewController(alert, animated: true, completion: nil)
            return
        }
        guard password != nil && !password!.isEmpty else {
            let alert = UIAlertController.simpleAlertWithTitle("提示", andMessage: "密码不能为空")
            presentViewController(alert, animated: true, completion: nil)
            return
        }
        let url = Urls.baseUrl + "login"
        let dict = ["username": username!, "password": password!]
        let session = NSURLSession.sharedSession()
        let request = NSMutableURLRequest.leanCloudRequestWithUrl(url, body: dict, needToken: false)
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error in
            if error != nil {
                print("error occurred while requesting \(error)")
                return
            }
            

            if let response = response as? NSHTTPURLResponse {
                let statusCode = response.statusCode
                let output = String(data: data!, encoding: NSUTF8StringEncoding)
                print(output)
                let jsonDict = try? NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments)
                if statusCode == 200 {
                    if let jsonDict = jsonDict {
                        let sessionToken = jsonDict["sessionToken"] as! String
                        User.sessionToken = sessionToken
                        let username = jsonDict["username"] as! String
                        User.username = username
                        let objectId = jsonDict["objectId"] as! String
                        User.objectId = objectId
                    }


                } else {
                    let code = jsonDict!["code"] as! String
//                    let
                }

                
            }
        })
        task.resume()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
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

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == usernameInput {
            passwordInput.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}