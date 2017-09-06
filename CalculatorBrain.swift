//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by student on 9/6/17.
//  Copyright © 2017 student. All rights reserved.
//

import Foundation
func changeSign(operand:Double)->Double
struct CalculatorBrain{
    private var accumulator: Double?
    
    private enum Operation {
        case Constant(Double)
        case UnaryOperation((Double)->Double)
        case BinaryOperation
        case Equals
    }
    private var operations:Dictionary<String,Operation> =
    ["π":Operation.Constant(Double.pi),
     "e":Operation.Constant(M_E),
     "±":Operation.UnaryOperation(changeSign),
    
          accumulator=value
     "√":Operation.UnaryOperation,//sqrt
    "cos":Operation.UnaryOperation//cos

      
    ]
    
    mutating func performOperation(_ symbol:String){
        if let operation=operations[symbol]{
            switch operation{
            case .Constant(let value):
                accumulator=value
            case .UnaryOperation:break
            case .BinaryOperation:break
            case .Equals:break
            }
        }
        
    }
    mutating func setOperant(_ operand:Double){
    accumulator = operand
    
    }
    
    var result:Double?{
        get {
        return accumulator!
        }
    }
    
    
    
        Operation.UnaryOperation
    }
