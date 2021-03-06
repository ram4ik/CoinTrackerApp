//
//  CoinViewModel.swift
//  CoinTrackerApp
//
//  Created by ramil on 25.09.2020.
//

import SwiftUI

struct CoinViewModel: Identifiable {
    
    var id: UUID {
        return UUID()
    }
    
    private let coin: Coin
    
    var name: String {
        return coin.name
    }
    
    var formattedPrice: String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        return formatter.string(from: Double(coin.price)! as NSNumber)!
    }
    
    var symbol: String {
        return coin.symbol.lowercased()
    }
    
    var color: Color {
        return Color(hex: coin.color)
    }
    
    var change: Double {
        return coin.change
    }
    
    var history: [Double] {
        let historyNums = coin.history.map { value in
            Double(value)!
        }
        
        let min = historyNums.min()!
        let max = historyNums.max()!
        
        var computedValues = [Double]()
        for item in historyNums {
            computedValues.append(item.converting(from: min...max, to: 0...1))
        }
        
        return computedValues
    }
    
    init(_ coin: Coin) {
        self.coin = coin
    }
}
