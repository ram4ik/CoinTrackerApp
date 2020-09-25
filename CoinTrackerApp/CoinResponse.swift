//
//  CoinResponse.swift
//  CoinTrackerApp
//
//  Created by ramil on 25.09.2020.
//

import Foundation

struct CoinResponse: Decodable {
    let status: String
    let data: CoinData
}
