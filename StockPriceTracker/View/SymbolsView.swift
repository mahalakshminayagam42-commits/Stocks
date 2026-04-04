//
//  SymbolsView.swift
//  StockPriceTracker
//
//  Created by Nivi on 03/04/26.
//

import SwiftUI

struct SymbolsView: View {
    
    @StateObject var viewModel : SymbolsViewModel
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                HStack {
                    ConnectionStatusView(state: viewModel.connectionState)
                    
                    Spacer()
                    
                    FeedControlButton(isRunning: viewModel.isFeedRunning, action: {
                        viewModel.toggleFeed()
                      }
                    )
                }
                
                .padding(.horizontal)
                
                Picker("Sort", selection: $viewModel.sortOption) {
                    ForEach(SortOption.allCases) { option in
                     Text(option.rawValue).tag(option)
                  }
                }
                
                .pickerStyle(.segmented)
                .padding(.horizontal)
             
                List(viewModel.stocks) { stock in
                    
                 NavigationLink(destination: SymbolDetailView(
                    stock: stock, viewModel: viewModel
                 )
                 ) {
                     StockRowView(stock: stock)
                 }
            
                }
                
                .listStyle(.plain)
            }
            .navigationTitle("Stocks")
        }
    }
}

