//
//  ImageTableViewCell.swift
//  TestAzteca
//
//  Created by PorMientras on 07/09/20.
//  Copyright © 2020 Misael Delgado Saucedo. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    @IBOutlet weak var imageFromURL : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
