//
//  RegisterViewController.swift
//  Things
//
//  Created by 周周 on 15/11/25.
//  Copyright © 2015年 youdian.org. All rights reserved.
//

import UIKit

class RegisterViewController: BaseViewController {

    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func register(sender: UIButton) {
        let username = usernameInput.text
        let password = passwordInput.text
        let dict = ["username": username!, "password": password!]
        let url = Urls.baseUrl + "users"
        let request = NSMutableURLRequest.leanCloudRequestWithUrl(url, body: dict, needToken: false)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: {data, response, error in
            let out = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print(out)
        })
        task.resume()
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
