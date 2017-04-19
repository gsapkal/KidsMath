//
//  MathTask.swift
//  KidsMath
//
//  Created by Ganesh Sapkal on 4/18/17.
//  Copyright © 2017 Panaromic Innovations Inc. All rights reserved.
//

import UIKit

class MathTask: UITableViewCell, UITextFieldDelegate {
    
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
    
    //Textfield delegates
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
  
        let  char = string.cString(using: String.Encoding.utf8)!
        let isBackSpace = strcmp(char, "\\b")
        if (isBackSpace == -92) {
            return true
        }
      
       return Int(string) != nil
    }
   
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if result.isFirstResponder && touch.view != result {
                result.resignFirstResponder()
            }
        }
        super.touchesBegan(touches, with: event)
    }

}
