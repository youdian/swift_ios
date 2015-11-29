//
//  ExpandCell.swift
//  tableviewdemo
//
//  Created by 周周 on 15/11/29.
//  Copyright © 2015年 youdian.org. All rights reserved.
//

import UIKit

class ExpandCell: UITableViewCell {

    @IBOutlet weak var first: UILabel!
    @IBOutlet weak var second: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
