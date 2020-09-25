//
//  ContentView.swift
//  CoinTrackerApp
//
//  Created by ramil on 25.09.2020.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var vm = CoinListViewModel()
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        UITableViewCell.appearance().selectionStyle = .none
        
        vm.getCoins()
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.base
            List {
                VStack(alignment: .center) {
                    Text("Coin Tracker")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.top, 50)
                        .newmorphicShadow()
                    
                    ForEach(vm.coins) { coin in
                        CoinCell(coin: coin)
                            .newmorphicShadow()
                    }
                }.background(Color.base)
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
