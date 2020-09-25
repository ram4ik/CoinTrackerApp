//
//  CoinCell.swift
//  CoinTrackerApp
//
//  Created by ramil on 25.09.2020.
//

import SwiftUI

struct CoinCell: View {
    
    let coin: CoinViewModel
    
    private let positiveChangeColor = Color.greenish
    private let negativeChangeColor = Color.red
    
    @State private var showGraph = false
    @State private var selectedItem: CoinViewModel?
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image(systemName: "bitcoinsign.circle" /* For downloaded images use -> coin.symbol */)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .padding(2)
                    .background(coin.color)
                    .cornerRadius(30)
                
                VStack(alignment: .leading) {
                    Text(coin.name)
                        .foregroundColor(Color.graish)
                    
                    Text(String(format: "%@%0.2f", coin.change > 0.0 ? "+" : "", coin.change))
                        .foregroundColor(coin.change > 0.0 ? positiveChangeColor : negativeChangeColor)
                }
                
                Spacer()
                
                VStack {
                    Text(coin.formattedPrice)
                        .foregroundColor(Color.graish)
                }
            }
            .newmorphicShadow()
            .padding()
            .background(
                Text(coin.symbol.uppercased())
                    .font(.system(size: 65))
                    .rotationEffect(.degrees(-45))
                    .foregroundColor(Color.darkShadow)
                    .opacity(0.1)
                    .newmorphicShadow()
                    .offset(x: 100)
            )
            .background(Color.base)
            .cornerRadius(20)
            .padding()
            .onTapGesture {
                self.showGraph.toggle()
            }
            
            if self.showGraph {
                GraphView(data: coin.history)
                    .frame(height: 200)
                    .offset(y: -25)
            }
        }
    }
}
