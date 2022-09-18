//
//  NumberValue.swift
//  Calculator
//
//  Created by Damaris Poppe on 6/9/22.
//

import Foundation

//getting one digit at a time and contruct a number
struct NumberValue {
    private(set) var value: String?
    mutating func addDigit(_ digit: String) {
        if digit == "." {
            if value == nil {
                value = "0."
            } else {
                if !value!.contains(".") {
                    value! += "."
                }
            }
        } else{
            if value == nil {
                value = digit
            } else {
                value! += digit
            }
        }
    }
    
    mutating func clear() {
        value = nil
    }
}
