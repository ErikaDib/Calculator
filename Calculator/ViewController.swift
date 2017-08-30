//
//  ViewController.swift
//  Calculator
//
//  Created by student on 8/28/17.
//  Copyright © 2017 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var display: UILabel!
    
    var userInTHeMiddleOfTyping : Bool=false
    
    var displayValue: Double{
        get{
            return Double(display.text!)!
        }
        set{
            display.text=String(newValue)
        }
    }
    
    
    @IBAction func touchDigit(_ sender: UIButton) {
        
        let textCurrentlyInDisplay=display.text!
        let digit=sender.currentTitle!
        print("\(digit) was pressed")
        
        
        if userInTHeMiddleOfTyping{
            display.text=textCurrentlyInDisplay+digit
        }else{
            display.text=digit
            userInTHeMiddleOfTyping=true
        }
        
        
    }

    
    @IBAction func performOperation(_ sender: UIButton) {
        userInTHeMiddleOfTyping=false
        if let mathematicalSymbol=sender.currentTitle{
            
            switch mathematicalSymbol{
            case "π":
                displayValue=Double.pi
            case "√":
                displayValue=sqrt(displayValue)
            default:
                break
            }
            
            
            
            
            
            /*
            if mathematicalSymbol=="π"{
                display!.text=String(Double.pi)
        }
        */
    }
    
    }
}
