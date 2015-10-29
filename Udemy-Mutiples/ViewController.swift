//
//  ViewController.swift
//  Udemy-Mutiples
//
//  Created by KimYong Jae on 2015. 10. 29..
//  Copyright © 2015년 YongJae Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var logoImg: UIImageView!
    @IBOutlet var inputField: UITextField!
    @IBOutlet var playBtn: UIButton!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var addBtn: UIButton!
    
    var resultNum: Int! = 0
    var currentNum: Int! = 1
    var firstNum: Int! = 0
    
    @IBAction func playButtonPressed(sender: AnyObject) {
        
        if (inputField.text != nil && inputField.text != ""){
            
            changeComponents()
            currentNum = 1
            firstNum = 0
            resultNum = Int(inputField.text!)!
            
            resultLabel.text = "\(firstNum) + \(resultNum) = \(resultNum)"
            firstNum = firstNum + resultNum
            
        } else {
            
            // UIAlertController Example
            let alert = UIAlertController(title: "", message: "입력을 해주세요!", preferredStyle: .Alert)
            
            let alertAction = UIAlertAction(title: "확인", style: .Default, handler: nil)
            alert.addAction(alertAction)
            
            self.presentViewController(alert, animated: false, completion: nil)
        }
        
    }
    
    @IBAction func addButtonPressed(sender: AnyObject) {
        
        let maxNum = resultNum
        if (currentNum < maxNum){
            resultLabel.text = "\(firstNum) + \(maxNum) = \(firstNum + maxNum)"
            firstNum = firstNum + maxNum
        } else {
            
            resultLabel.text = ""
            changeComponents()
            
        }
        
        currentNum!++
    }
    
    func changeComponents() {
        logoImg.hidden = !logoImg.hidden
        inputField.hidden = !inputField.hidden
        playBtn.hidden = !playBtn.hidden
        resultLabel.hidden = !resultLabel.hidden
        addBtn.hidden = !addBtn.hidden
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
}

