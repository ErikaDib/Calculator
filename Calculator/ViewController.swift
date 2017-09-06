//
//  ViewController.swift
//  Calculator
//
//  Created by student on 8/28/17.
//  Copyright © 2017 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var brain:CalculatorBrain=CalculatorBrain()

   
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
        if(userInTHeMiddleOfTyping){
            brain.setOperant(displayValue)
            userInTHeMiddleOfTyping=false
            
        }
        if let mathematicalSymbol=sender.currentTitle{
            
            brain.performOperation(mathematicalSymbol)
        }
        if let result = brain.result{
            displayValue=result
        }
        
            /*
            if mathematicalSymbol=="π"{
                display!.text=String(Double.pi)
        }
        */
    }
    
    }

