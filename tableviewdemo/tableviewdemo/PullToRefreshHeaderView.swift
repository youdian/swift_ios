//
//  RefreshView.swift
//  tableviewdemo
//
//  Created by 周周 on 15/11/29.
//  Copyright © 2015年 youdian.org. All rights reserved.
//

import UIKit

enum RefreshState: Int {
    case Normal, Loading, Pulling
}

class PullToRefreshHeaderView: UIView {
    var stateLabel: UILabel!
    let offsetThreshold: CGFloat = 60
    let pullToRefeshText = "下拉刷新"
    let releaseToRefreshText = "松开刷新"
    private let loadingText = "正在刷新"
    let duration = 0.5
    var state: RefreshState = .Normal {
        didSet {
            print("refreshView status changed to \(state)")
            switch state {
            case .Normal:
                stateLabel.text = pullToRefeshText
            case .Pulling:
                stateLabel.text = releaseToRefreshText
            case .Loading:
                stateLabel.text = loadingText
                
            }
        }
    }
    var delegate: PullToRefreshHeaderViewDelegate?
    var height: CGFloat {
        return self.bounds.height
    }
    var width: CGFloat {
        return self.bounds.width
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.autoresizingMask = .FlexibleWidth
        self.backgroundColor = UIColor.greenColor()
        stateLabel = UILabel(frame: CGRectMake(0, height - 40, width, 20))
        stateLabel.autoresizingMask = .FlexibleWidth
        stateLabel.font = UIFont.systemFontOfSize(12)
        stateLabel.textColor = UIColor.blueColor()
        stateLabel.textAlignment = .Center
        addSubview(stateLabel)
        state = .Normal
        stateLabel.text = pullToRefeshText
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("scrollViewDidEndDragging...")
        if state == .Pulling {
            delegate?.startLoading()
            state = .Loading
        }

    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if state == .Loading {
           let offset = min(max(-scrollView.contentOffset.y, 0), offsetThreshold)
            UIView.animateWithDuration(0.5, animations: {
                scrollView.contentInset = UIEdgeInsetsMake(offset, 0, 0, 0)
            })

        } else if scrollView.dragging {
            let contentOffset = scrollView.contentOffset.y
            if state == .Normal && contentOffset < -offsetThreshold {
                state = .Pulling
            } else if state == .Pulling && contentOffset < 0 && contentOffset > -offsetThreshold {
                state = .Normal
            }
        }

    }
    
    func finishLoading(scrollView: UIScrollView) {
        UIView.animateWithDuration(duration, animations: {
            scrollView.contentInset = UIEdgeInsetsZero
            }, completion: { completed in
                self.state = .Normal
        })
    }

}

protocol PullToRefreshHeaderViewDelegate {
    func startLoading()
}
