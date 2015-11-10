//
//  CenterViewController.swift
//  slidingmenu
//
//  Created by 周周 on 15/11/10.
//  Copyright © 2015年 youdian.org. All rights reserved.
//

import UIKit

class CenterViewController: UIViewController {

    @IBOutlet weak var centerLabel: UILabel!
    var delegate: CenterViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showLeftMenu(sender: UIBarButtonItem) {
        delegate?.showMenu()
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

protocol CenterViewControllerDelegate {
    func showMenu()
    func hideMenu()
}

extension CenterViewController: LeftViewControllerDelegate {
    func onClick() {
        self.centerLabel.text = "you click the button"
        delegate?.hideMenu()
    }
}
