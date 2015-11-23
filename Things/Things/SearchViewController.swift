//
//  SearchViewController.swift
//  Things
//
//  Created by 周周 on 15/11/23.
//  Copyright © 2015年 youdian.org. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    var data: [String] = [String]()
    var filteredData: [String] = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initData() {
        data.append("item 1")
        data.append("title 1")
        data.append("item 2")
        data.append("title 2")
        data.append("item 3")
        data.append("content 1")
    }
    
    func filterData(searchText: String) {
        filteredData = data.filter({item -> Bool in
            return item.rangeOfString(searchText) != nil
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

extension SearchViewController: UISearchBarDelegate, UISearchDisplayDelegate {
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchString searchString: String?) -> Bool {
        filterData(searchString!)
        return true
    }
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "Cell"
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: identifier)
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath)
        cell.textLabel?.text = filteredData[indexPath.row]
        return cell
    }
}