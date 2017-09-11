//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by student on 9/6/17.
//  Copyright © 2017 student. All rights reserved.
//

import Foundation






struct CalculatorBrain{
    
    private var accumulator: Double?
    
    private enum Operation {
        case Constant(Double)
        case UnaryOperation((Double)->Double)
        case BinaryOperation((Double,Double)->Double)
        case Equals
    }
    private var operations:Dictionary<String,Operation> =
    [
        
    "π":Operation.Constant(Double.pi),
     "e":Operation.Constant(M_E),
     "±":Operation.UnaryOperation({-$0}),
    "√":Operation.UnaryOperation(sqrt),//sqrt
    "cos":Operation.UnaryOperation(cos),//cos
    "×":Operation.BinaryOperation({return $0 * $1}),
    "÷":Operation.BinaryOperation({return $0 / $1}),
    "+":Operation.BinaryOperation({return $0 + $1}),
    "-":Operation.BinaryOperation({return $0 - $1}),
    "=": Operation.Equals

      
    ]
    
    private struct  PendingBinaryOperation {
    
    let function : (Double,Double) -> Double
        let firstOperand:Double
        
        func Perform(with secondOperand: Double) -> Double{
            return function(firstOperand,secondOperand)
        }
    }
    
    private var pedingBinaryOperation: PendingBinaryOperation?
    
    mutating func performOperation(_ symbol:String){
        if let operation=operations[symbol]{
            switch operation{
            case .Constant(let value):
                accumulator=value
            case .UnaryOperation(let function):
                if accumulator != nil{
                    accumulator=function(accumulator!)
                }
            case .BinaryOperation(let function):
                if(accumulator != nil){
                    pedingBinaryOperation=PendingBinaryOperation(function:function,firstOperand: accumulator!)
                    accumulator=nil
                }
            case .Equals:
                if(pedingBinaryOperation != nil && accumulator != nil){
                    accumulator=pedingBinaryOperation!.Perform(with: accumulator!)
                    pedingBinaryOperation=nil
                }
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
    
    
    
        //Operation.UnaryOperation
    }
