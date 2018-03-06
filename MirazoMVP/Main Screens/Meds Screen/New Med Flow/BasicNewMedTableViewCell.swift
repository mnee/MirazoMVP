//
//  BasicNewMedTableViewCell.swift
//  MirazoMVP
//
//  Created by Mischa Nee on 3/5/18.
//  Copyright © 2018 Mischa Nee. All rights reserved.
//

import UIKit

class BasicNewMedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var Icon: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
