//
//  ItemRow.swift
//  SwiftUILearning
//
//  Created by Ivan Lesko on 6/2/24.
//

import SwiftUI

struct ItemRow: View {
    let item: MenuItem
    
    var body: some View {
        let colors: [String: Color] = ["D": .purple,
                                       "G": .black,
                                       "N": .red,
                                       "S": .blue,
                                       "V": .green]
        NavigationLink {
            ItemDetail(item: item)
        } label: {
            HStack {
                Image(item.thumbnailImage)
                    .clipShape(Circle())
                    .overlay(Capsule().stroke(.black, lineWidth: 2))
                
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.headline)
                    Text("$\(item.price)")
                }
                
                Spacer()
                    
                
                ForEach(item.restrictions, id: \.self) { restriction in
                    Text(restriction)
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(5)
                        .background(colors[restriction, default: .black])
                        .clipShape(Circle())
                        .foregroundStyle(.white)
                }
                
                Spacer()
                    .frame(width: 20)
            }
        }
        
        
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
