//
//  CalculatorButtonView.swift
//  Calculator-Swift
//
//  Created by Damaris Poppe on 9/20/22.
//

import SwiftUI

extension CalculatorView {
    struct CalculatorButton: View {
        @EnvironmentObject private var viewModel: ViewModel
        
        var button: String
        
        var body: some View {
            Button (button) {
                viewModel.performAction(for: button)
            }
            .buttonStyle(CalculatorButtonStyle(
                size: getButtonSize(),
                //backgroundColor: getBackgroundColor(of: button),
                backgroundColor: .black,
                foregroundColor: .white
            ))
        }
        
        private func getButtonSize() -> CGFloat {
            let screenWidth = UIScreen.main.bounds.width
            let buttonCount: CGFloat = Constants.buttonsInARow
            let numberOfSpaces = buttonCount + 1
            
            return (screenWidth - numberOfSpaces * Constants.padding) / buttonCount
        }
        
        /*private func getBackgroundColor(of button: String) -> Color {
            if viewModel.isDigit(button) {
                return Color(.blue)
            }
            else {
                return Color(.red )
            }
        }*/
    }
}
