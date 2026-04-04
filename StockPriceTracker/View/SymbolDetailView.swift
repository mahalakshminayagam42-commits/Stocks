//
//  SymbolDetailView.swift
//  StockPriceTracker
//
//  Created by Nivi on 03/04/26.
//

import SwiftUI

struct SymbolDetailView: View {
    
    let stock : Stock
    @ObservedObject var viewModel : SymbolsViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text(stock.symbol ?? "")
            .font(.largeTitle)
            .bold()
            
            if let updatedStock = viewModel.stocks.first(where: {$0.id == stock.id}) {
                
                Text("\(updatedStock.currentPrice ?? 0.0,specifier : "%.2f")")
                
                Text("\(updatedStock.priceChange,specifier: "%2f")")
                
                    .foregroundColor(updatedStock.priceChange >= 0 ? .gray : .red)
                
            }
            
            ConnectionStatusView(state: viewModel.connectionState)
            
            FeedControlButton(isRunning: viewModel.isFeedRunning, action: {
                viewModel.toggleFeed()
            }
            )
            
            Spacer()
            
        }
        
        .padding()
        .navigationTitle(stock.symbol ?? "")
    }
}


