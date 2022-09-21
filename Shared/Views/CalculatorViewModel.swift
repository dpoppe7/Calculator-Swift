//
//  CalculatorViewModel.swift
//  Calculator
//
//  Created by Damaris Poppe on 13/9/22.
//

import Foundation

extension CalculatorView {
    final class ViewModel: ObservableObject {
        //we can only access this variable from the view model
        @Published private var calculator = CalculatorBrain()
        @Published private var number = NumberValue()
        
        //Pick what buttons to have
        var buttons: [[String]] {
            [
                ["7", "8", "9", "+"],
                ["4", "5", "6", "-"],
                ["1", "2", "3", "*"],
                ["0", "C", ".", "÷"],
                ["X2","%", "="]
                //pi, e, goldrat, root, +/-
            ]
        }
        
        private var digits: [String] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "."]
        
        //Fucntions that will change the model
        func performAction (for button: String){
            if digits.contains(button) {
                number.addDigit(button)
            }
            else {
                if number.value != nil {
                    calculator.setOperand(Decimal(string: number.value!)!) //if get an error at some point//check this part
                    number.clear() //making sure we don't add to the previous number
                }
                calculator.performOperation(button)
            }
        }
        
        //Functions that will get a current value
        var displayText: String {
            if let value = number.value {
                return value;
            }
            else {
                return calculator.displayText
            }
        }
        
        func isDigit(for button: String) -> Bool {
            if digits.contains(button) && button != "."{
                return true
            }
            else{
                return false
            }
        }
    }
}
