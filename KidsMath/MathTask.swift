//
//  MathTask.swift
//  KidsMath
//
//  Created by Ganesh Sapkal on 4/18/17.
//  Copyright © 2017 Panaromic Innovations Inc. All rights reserved.
//

import UIKit

class MathTask: UITableViewCell {
    
    //MARK: Properties
    
    @IBOutlet var operand1: UILabel!
    
    @IBOutlet var operation: UILabel!
    
    @IBOutlet var operand2: UILabel!
    
    @IBOutlet var equals: UILabel!
    
    @IBOutlet var result: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
