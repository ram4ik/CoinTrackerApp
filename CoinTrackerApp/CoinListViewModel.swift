//
//  CoinListViewModel.swift
//  CoinTrackerApp
//
//  Created by ramil on 25.09.2020.
//

import Foundation
import Combine

class CoinListViewModel: ObservableObject {
    
    @Published var coins = [CoinViewModel]()
    
    private let coinService = CoinService()
    
    var cancellable: AnyCancellable?
    
    func getCoins() {
        
        guard let getCoins = coinService.getCoins() else {
            print("No data")
            return
        }
        
        cancellable = getCoins.sink(receiveCompletion: { err in
            print(err)
        }) { coinRes in
            self.coins = coinRes.data.coins.map { CoinViewModel($0) }
        }
    }
}
