//
//  ViewController.swift
//  KidsMath
//
//  Created by Ganesh Sapkal on 4/18/17.
//  Copyright © 2017 Panaromic Innovations Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let operation = sender as! UIButton
        let destinationVC = segue.destination as! MathTaskTableViewController
        
        if (operation.currentTitle == "Addition") {
            destinationVC.operation = "+"
            destinationVC.instruction = "Add the numbers in table - "
            
        } else if (operation.currentTitle == "Subtraction") {
            destinationVC.operation = "-"
            destinationVC.instruction = "Subtract the numbers in table - "
            
        } else if (operation.currentTitle == "Division") {
            destinationVC.operation = "%"
            destinationVC.instruction = "Divide the numbers in table - "
            
        } else if (operation.currentTitle == "Multiplication") {
            destinationVC.operation = "*"
            destinationVC.instruction = "Multiply the numbers in table - "
            
        }
    }
   
}

