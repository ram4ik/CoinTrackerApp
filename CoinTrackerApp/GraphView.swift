//
//  GraphView.swift
//  CoinTrackerApp
//
//  Created by ramil on 25.09.2020.
//

import SwiftUI

struct GraphView: View {
    
    @State private var on = false
    
    var data: [Double]
    var strokeColor: Color = Color.blue
    
    var body: some View {
        VStack {
            LineGraph(dataPoints: data)
                .trim(to: on ? 1 : 0)
                .stroke(strokeColor, lineWidth: 2)
                .aspectRatio(16/9, contentMode: .fit)
                .border(Color.base, width: 1)
                .padding()
                .onAppear() {
                    withAnimation(Animation.easeOut(duration: 2)) {
                        self.on.toggle()
                    }
                }
        }
    }
}
