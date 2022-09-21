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
            Spacer()
            
            Text(viewModel.displayText)
                .padding()
                .frame(maxWidth: .infinity, alignment: .trailing)
                .font(.system(size: 80, weight: .medium))
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .background(.orange)
            
            //Buttons
            buttonArea
                .padding()
        }
    }
}

struct CalculatorView_Previews: PreviewProvider{
    static var previews: some View {
        CalculatorView()
            .environmentObject(CalculatorView.ViewModel())
            .previewInterfaceOrientation(.portrait)
    }
}

extension CalculatorView {
    private var buttonArea: some View {
        VStack {
            ForEach(viewModel.buttons, id: \.self) {
                row in HStack {
                    ForEach(row, id: \.self) {
                        button in CalculatorButton(button: button)
                    }
                }
            }
        }
    }
}
