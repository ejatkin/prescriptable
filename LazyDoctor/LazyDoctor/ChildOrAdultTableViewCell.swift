//
//  ChildOrAdultTableViewCell.swift
//  LazyDoctor
//
//  Created by Elizabeth Atkin on 01/02/2017.
//  Copyright © 2017 Elizabeth Atkin, Dan Pelensky, Veronica Sonzini. All rights reserved.
//

import UIKit

class ChildOrAdultTableViewCell: UITableViewCell {

    @IBOutlet weak var childoradultLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
