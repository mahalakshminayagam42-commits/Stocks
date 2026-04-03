//
//  PriceChangeView.swift
//  StockPriceTracker
//
//  Created by Nivi on 03/04/26.
//

import SwiftUI

struct PriceChangeView: View {
    let stock : Stock
    var body: some View {
        Text("\(stock.isPositive ? "+" : "")\(String(format: "%2f",stock.priceChange))")
            .font(.caption.weight(.semibold))
            .foregroundColor(stock.isPositive ? .green: .red)
            .padding(.horizontal,10)
            .padding(.vertical,6)
            .background((stock.isPositive ? Color.green : Color.red).opacity(0.12))
            .clipShape(Capsule())
    }
}
