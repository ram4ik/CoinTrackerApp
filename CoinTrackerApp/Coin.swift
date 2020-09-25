//
//  Coin.swift
//  CoinTrackerApp
//
//  Created by ramil on 25.09.2020.
//

import Foundation

struct Coin: Decodable {
    let name: String
    let price: String
    let symbol: String
    let color: String
    let change: Double
    let history: [String]
}
