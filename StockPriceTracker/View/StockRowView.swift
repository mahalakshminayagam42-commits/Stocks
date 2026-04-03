//
//  StockRowView.swift
//  StockPriceTracker
//
//  Created by Nivi on 03/04/26.
//

import SwiftUI

struct StockRowView: View {
    
    let stock : Stock
    
    var body: some View {
        HStack {
            VStack(alignment: .leading,spacing: 4) {
                Text(stock.symbol ?? "")
                    .font(.headline)
                
                Text(stock.name ?? "")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 6) {
                Text(String(format: "$%.2f", stock.currentPrice ?? 0.0))
                
                PriceChangeView(stock: stock)
            }
        }
        .padding(.vertical,6)
    }
}


