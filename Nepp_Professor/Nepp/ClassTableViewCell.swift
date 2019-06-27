//
//  ClassTableViewCell.swift
//  Nepp
//
//  Created by 윤현담 on 27/06/2019.
//  Copyright © 2019 윤현담. All rights reserved.
//

import Foundation
import UIKit

class ClassTableViewCell: UITableViewCell {
    
    @IBOutlet var cLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
