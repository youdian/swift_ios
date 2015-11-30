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
    var activityIndicator: UIActivityIndicatorView!
    let offsetThreshold: CGFloat = 60
    let pullToRefeshText = "下拉刷新"
    let releaseToRefreshText = "松开刷新"
    private let loadingText = "正在刷新"
    let duration = 0.5
    let indicatorSize: CGFloat = 15
    var state: RefreshState = .Normal {
        didSet {
            print("refreshView status changed to \(state)")
            switch state {
            case .Normal:
                stateLabel.text = pullToRefeshText
                activityIndicator.hidden = true
                if activityIndicator.isAnimating() {
                    activityIndicator.stopAnimating()
                }
            case .Pulling:
                stateLabel.text = releaseToRefreshText
                if activityIndicator.hidden {
                    activityIndicator.hidden = false
                }
            case .Loading:
                stateLabel.text = loadingText
                activityIndicator.startAnimating()
                
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
        self.backgroundColor = UIColor.clearColor()
        stateLabel = UILabel()
        stateLabel.translatesAutoresizingMaskIntoConstraints = false
        stateLabel.font = UIFont.systemFontOfSize(12)
        stateLabel.textColor = UIColor.grayColor()
        addSubview(stateLabel)
        activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.hidden = true
        activityIndicator.color = UIColor.grayColor()
        addSubview(activityIndicator)
        let centerConstraint = NSLayoutConstraint(item: stateLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0)
        self.addConstraint(centerConstraint)
        let yConstraint = NSLayoutConstraint(item: stateLabel, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: 1, constant: -20)
        self.addConstraint(yConstraint)
        let heightConstraint = NSLayoutConstraint(item: stateLabel, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 20)
        stateLabel.addConstraint(heightConstraint)
        
        let indicatorWidthCons = NSLayoutConstraint(item: activityIndicator, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: indicatorSize)
        activityIndicator.addConstraint(indicatorWidthCons)
        let indicatorHeightCons = NSLayoutConstraint(item: activityIndicator, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: indicatorSize)
        activityIndicator.addConstraint(indicatorHeightCons)
        let indicatorXCons = NSLayoutConstraint(item: activityIndicator, attribute: .Right, relatedBy: .Equal, toItem: stateLabel, attribute: .Left, multiplier: 1, constant: -10)
        self.addConstraint(indicatorXCons)
        let indicatorYCons = NSLayoutConstraint(item: activityIndicator, attribute: .CenterY, relatedBy: .Equal, toItem: stateLabel, attribute: .CenterY, multiplier: 1, constant: 0)
        self.addConstraint(indicatorYCons)
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
