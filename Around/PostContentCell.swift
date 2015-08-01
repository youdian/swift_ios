//
//  PostContentCellTableViewCell.swift
//  Around
//
//  Created by 周周 on 15/6/14.
//  Copyright (c) 2015年 youdian.org. All rights reserved.
//

import UIKit

class PostContentCell : UITableViewCell {

    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var author: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
