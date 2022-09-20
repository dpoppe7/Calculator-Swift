//
//  CalculatorView.swift
//  Calculator
//
//  Created by Damaris Poppe on 13/9/22.
//

import Foundation
import SwiftUI

struct CalculatorView: View {
    @EnvironmentObject private var viewModel: ViewModel
    
    var body: some View {
        VStack{
            //Display
            Text(viewModel.displayText)
            
            //Buttons
            VStack {
                ForEach(viewModel.buttons, id: \.self) {
                    row in HStack {
                        ForEach(row, id: \.self) {
                            button in Button(button) {
                                viewModel.performAction(for: button)
                            }
                        }
                    }
                }
            }
        }
        .font(.largeTitle)
    }
}

struct CalculatorView_Previews: PreviewProvider{
    static var previews: some View {
        CalculatorView()
            .environmentObject(CalculatorView.ViewModel())
            .previewInterfaceOrientation(.portrait)
    }
}
