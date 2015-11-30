//
//  InnerTableView.swift
//  scrollviewdemo
//
//  Created by 周周 on 15/11/30.
//  Copyright © 2015年 youdian.org. All rights reserved.
//

import UIKit

class InnerTableView: UITableView {
    var heightChangedDelegate: InnerTableViewDelegate?
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    override func layoutSubviews() {
        super.layoutSubviews()
        let contentHeight = self.contentSize.height
        let frame = self.frame
        self.frame = CGRect(origin: frame.origin, size: CGSize(width: frame.width, height: contentHeight))
        heightChangedDelegate?.tableView(self, heightChangedTo: contentHeight)
        print(contentHeight)
    }
}

protocol InnerTableViewDelegate {
    func tableView(tableView: InnerTableView, heightChangedTo height: CGFloat)
}