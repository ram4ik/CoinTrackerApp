//
//  Double+Extension.swift
//  CoinTrackerApp
//
//  Created by ramil on 25.09.2020.
//

import Foundation

extension Double {
    
    func converting(from input: ClosedRange<Self>, to output: ClosedRange<Self>) -> Self {
        
        let x = (output.upperBound - output.lowerBound) * (self - input.lowerBound)
        let y = (input.upperBound - input.lowerBound)
        return x / y + output.lowerBound
    }
}
