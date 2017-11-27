//
//  MyCell.swift
//  AsynchImage
//
//  Created by 周彥宏 on 2017/7/4.
//  Copyright © 2017年 周彥宏. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {
    
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var kindLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var shelterNameLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
