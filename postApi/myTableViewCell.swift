//
//  myTableViewCell.swift
//  postApi
//
//  Created by R & W on 25/03/23.
//

import UIKit

class myTableViewCell: UITableViewCell {
    @IBOutlet weak var l1: UILabel!
    @IBOutlet weak var l2: UILabel!
    
    @IBOutlet weak var img: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
