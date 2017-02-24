//
//  EventTableViewCell.swift
//  dsy
//
//  Created by Alfredo Luco on 24-02-17.
//  Copyright © 2017 Dsarhoya. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    
    
    @IBOutlet var category: UILabel!
    @IBOutlet var title: UILabel!
    @IBOutlet var date: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
