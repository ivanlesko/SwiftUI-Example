//
//  ItemDetail.swift
//  SwiftUILearning
//
//  Created by Ivan Lesko on 6/25/24.
//

import Foundation
import SwiftUI

struct ItemDetail: View {
    @EnvironmentObject var order: Order
    
    let item: MenuItem
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomLeading) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(5)
                
                let padding: CGFloat = 10
                
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(.white)
                    .font(.caption)
                    .fontWeight(.bold)
                    .cornerRadius(5)
                    .foregroundColor(.black)
                    .offset(x: padding, y: -padding)
            }
            
            Text(item.description)
            
            Button("Order this") {
                order.add(item: item)
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
        .padding(12)
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ItemDetail(item: MenuItem.example)
                .environmentObject(Order())
        }
    }
}
