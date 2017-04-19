//
//  MathTaskTableViewController.swift
//  KidsMath
//
//  Created by Ganesh Sapkal on 4/18/17.
//  Copyright © 2017 Panaromic Innovations Inc. All rights reserved.
//

import UIKit

class MathTaskTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var submitAction: UIButton!
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var submitBtn: UIButton!
    
    var operation : String?
    var instruction : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func submitAnswers(_ sender: Any) {
        let cells = self.tableView.visibleCells
  
        for cell in cells {
            let mathTask = cell as! MathTask
            let pValue = mathTask.result.text!
            
            if (pValue != "" ) {
                let num1 = Int(mathTask.operand1.text!)
                let num2 = Int(mathTask.operand2.text!)
                
                guard let result = Int(mathTask.result.text!) else {
                    mathTask.result.backgroundColor = UIColor.red
                    continue
                }
                
                if ( (operation == "+") && ( (num1! + num2!) == result) ||
                     (operation == "-") && ( (num1! - num2!) == result) ||
                     (operation == "/") && ( (num1!/num2!) == result) ||
                     (operation == "x") && ( (num1! * num2!) == result)
                    ) {
                    mathTask.result.backgroundColor = UIColor.green
                } else {
                    mathTask.result.backgroundColor = UIColor.red
                }
            } else {
                mathTask.result.backgroundColor = UIColor.red
            }
        }

    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return instruction
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //Number of sections in table
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                 // return the number of rows
        return (Int(tableView.bounds.height / tableView.rowHeight) - 5 )

    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cellIdentifier = "mathTask"
       guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MathTask else {
            fatalError("The dequeued cell is not an instance of mathTask.")
        }
        
        //Set the result text filed delegate.
        cell.result.delegate = cell
        cell.result.keyboardType = .numberPad
        cell.result.becomeFirstResponder()
        
        if (operation == "/" || operation == "*") {
            var number1 = getNonZeroRandomNumber(max: 10)
            let number2 = getNonZeroRandomNumber(max: 10)
            if(operation == "/") {
                number1 = number2*number1
            }
            cell.operand1.text = String(number1)
            cell.operand2.text = String(number2)
        } else {
            var number1 = getNonZeroRandomNumber(max: 100)
            var number2 = getNonZeroRandomNumber(max: 100)
            if (operation == "-") {
                //Swap the numbers
                if number1 < number2 {
                    number1 = number1 + number2
                    number2 = number1 - number2
                    number1 = number1 - number2
                }
            }
            cell.operand1.text = String(number1)
            cell.operand2.text = String(number2)
        }
       
        
       
        cell.operation.text = operation
        
        cell.equals.text = "="
        return cell
    }
    
    func getNonZeroRandomNumber(max : UInt32) -> Int {
        
        while (true) {
            let retVal = Int(arc4random_uniform(max))
            
            if (retVal > 0) {
                return retVal
            }
        }
    }
   

}
