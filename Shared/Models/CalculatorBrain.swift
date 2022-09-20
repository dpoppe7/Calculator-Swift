//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Damaris Poppe on 6/9/22.
//

import Foundation

struct CalculatorBrain {
    
    private var accumulator: Decimal? //optional decimal
    
    //What kind of operators can we have?
    enum Operation {
        case constant (Decimal)
        case unaryOperator((Decimal) -> Decimal)
        case binaryOperator((Decimal, Decimal) -> Decimal)
        case equals
        case clear
    }
    
    var operations: [String : Operation] = [
        //"+": .binaryOperator({(x: Decimal, y: Decimal) in x + y})   //removed explicitit return type
        "+": .binaryOperator(+),
        "-": .binaryOperator(-),
        "*": .binaryOperator(*),
        "÷": .binaryOperator(/),
        "=": .equals,
        "C": .clear
    ]
     
    mutating func setOperand (_ operand: Decimal) {
        accumulator = operand;
    }
    
    var displayText: String {
        //if there is a value in the accumulator, otherwise give the value of 0
        return "\(accumulator ?? 0)"
    }
    
    //mutating - function that modifies a struct
    mutating func performOperation(_ symbol : String) {
        if let operation = operations[symbol] {
            switch operation {
            case . constant(let value):
                accumulator = value
            
            case .unaryOperator(let function):
                if accumulator != nil {
                    accumulator = function(accumulator!) //! forcing to assign value since accumulator was optional
                }
                
            case .binaryOperator(let function):
                performOperationInProgress()
                if accumulator != nil {
                    operationInProgress = OperationInProgress(firstOperand: accumulator!, function: function)
                }
            case .equals:
                performOperationInProgress()  //retunrs the resulted value, performs operation
            case .clear:
                accumulator = nil
                operationInProgress = nil
            }
        }
    }
    
    //mutating function
    private mutating func performOperationInProgress() {
        if accumulator != nil && operationInProgress != nil {
            accumulator = operationInProgress!.perform(with: accumulator!) //force unwarap accumulator
        }
    }
    
    private var operationInProgress: OperationInProgress? //we don't need an operationInProgress always
    
    private struct OperationInProgress {
        let firstOperand: Decimal
        let function: (Decimal, Decimal) -> Decimal
        
        func perform(with secondOperand: Decimal) -> Decimal {
            return function(firstOperand, secondOperand)
        }
    }
    
}
