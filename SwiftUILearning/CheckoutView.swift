//
//  CheckoutView.swift
//  SwiftUILearning
//
//  Created by Ivan  on 7/12/24.
//

import SwiftUI
import Combine

struct CheckoutView: View {
    private enum PaymentType: String, CaseIterable {
        case cash = "Cash"
        case card = "Credit card"
        case points = "Points"
        case giftCard = "Gift card"
        case virtual = "Virtual"
    }
    
    @EnvironmentObject var order: Order
    
    private let paymentTypes = PaymentType.allCases
    private let tipAmounts = [5, 10, 15, 20, 0]
    
    @State private var paymentType = PaymentType.cash
    @State private var tipAmount = 15
    @State private var timer: AnyCancellable?
    
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    
    var body: some View {
        Form {
            Section {
                Picker("Select payment type", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) { payment in
                        Text(payment.rawValue)
                            .tag(payment)
                    }
                }
                .animation(.easeOut, value: paymentType)
                
                Toggle("Use loyalty card", isOn: $addLoyaltyDetails)
                
                if addLoyaltyDetails {
                    TextField("Enter custom ID", text: $loyaltyNumber)
                }
            }
            
            Section("Add a tip?") {
                Picker("Percent:", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }
            }
            
            Section("Total: $0") {
                Button("Place Order") {
                    // place order here
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            startTimer()
        }
        .onDisappear {
            stopTimer()
        }
    }
    
    private func startTimer() {
        timer = Timer.publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .sink(receiveValue: { _ in
                let types = PaymentType.allCases
                
                if let index = types.firstIndex(of: paymentType) {
                    let next = (index + 1) % types.count
                    
                    paymentType = types[next]
                }
            })
    }
    
    private func stopTimer() {
        
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView().environmentObject(Order())
    }
}
