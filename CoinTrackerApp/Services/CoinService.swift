//
//  CoinService.swift
//  CoinTrackerApp
//
//  Created by ramil on 25.09.2020.
//

import Foundation
import Combine

final class CoinService {
    
    let symbols = ["btc", "eth", "usdt", "xrp", "bch", "ada", "ltc", "cro"]
    lazy var urlComponents: URLComponents = {
        var component = URLComponents()
        component.scheme = "https"
        component.host = "api.coinranking.com"
        component.path = "/v1/public/coins"
        component.queryItems = [
            URLQueryItem(name: "base", value: "USD"),
            URLQueryItem(name: "timePeriod", value: "7d"),
            URLQueryItem(name: "symbols", value: symbols.joined(separator: ","))]
        return component
    }()
    
    func getCoins() -> AnyPublisher<CoinResponse, Error>? {
        guard let url = urlComponents.url else { return nil }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: CoinResponse.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
