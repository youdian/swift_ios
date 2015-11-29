//
//  RefreshView.swift
//  tableviewdemo
//
//  Created by 周周 on 15/11/29.
//  Copyright © 2015年 youdian.org. All rights reserved.
//

import UIKit

enum RefreshStatus: Int {
    case Normal, Loading, PendLoading
}

class RefreshView: UIView {
    var statusLabel: UILabel!
    let offset: CGFloat = 60
    let loadingHeight: CGFloat = 40
    let pullToRefesh = "下拉刷新"
    let releaseToRefresh = "松开刷新"
    private let loading = "正在刷新"
    var status: RefreshStatus = .Normal {
        didSet {
            print("refreshView status changed to \(status)")
        }
    }
    var delegate: RefreshViewDelegate?
    var height: CGFloat {
        return self.bounds.height
    }
    var width: CGFloat {
        return self.bounds.width
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        statusLabel = UILabel(frame: CGRectMake(50, height - 30, 100, 20))
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.font = UIFont.systemFontOfSize(14)
        statusLabel.textColor = UIColor.blueColor()
        statusLabel.text = pullToRefesh
        addSubview(statusLabel)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        print("scrollViewDidEndDecelerating...")
    }
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("scrollViewDidEndDragging...")
        if status == .PendLoading {
            delegate?.onLoading()
            status = .Loading
            statusLabel.text = loading
        }

    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
//        print("offsetY=\(offsetY)")
        if -offsetY >= offset {
            statusLabel.text = releaseToRefresh
            scrollView.contentOffset = CGPoint(x: scrollView.contentOffset.x, y: -offset)
            status = .PendLoading
        } else if -offsetY > 0 && -offsetY < loadingHeight {
            if status == .Loading {
                scrollView.contentOffset = CGPoint(x: scrollView.contentOffset.x, y: -loadingHeight)
            } else if status == .PendLoading {
                finishLoading()
            }
        }
    }
    
    func finishLoading() {
        status = .Normal
        statusLabel.text = pullToRefesh
    }

}

protocol RefreshViewDelegate {
    func onLoading()
}
