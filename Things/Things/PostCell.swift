//
//  PostCell.swift
//  Things
//
//  Created by 周周 on 15/11/22.
//  Copyright © 2015年 youdian.org. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var largeImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        contentView.layoutIfNeeded()
//        content.preferredMaxLayoutWidth = content.frame.size.width
//    }

}
