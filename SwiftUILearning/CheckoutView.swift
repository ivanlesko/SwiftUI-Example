//
//  CheckoutView.swift
//  SwiftUILearning
//
//  Created by Ivan  on 7/12/24.
//

import SwiftUI

struct CheckoutView: View {
    private enum PaymentType: String, CaseIterable {
        case cash = "Cash"
        case card = "Credit card"
        case points = "Points"
    }
    
    @EnvironmentObject var order: Order
    
    private let paymentTypes = PaymentType.allCases
    
    @State private var paymentType = PaymentType.cash
    
    var body: some View {
        VStack {
            Section {
                Picker("Select payment type", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) { payment in
                        Text(payment.rawValue)
                            .tag(payment)
                    }
                }
                .pickerStyle(.wheel)
            }
            
            
            Spacer()
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .onChange(of: paymentType) { newValue in
            print("payment type changed: \(newValue)")
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView().environmentObject(Order())
    }
}
