//
//  PriceGenerator.swift
//  StockPriceTracker
//
//  Created by Nivi on 02/04/26.
//

import Foundation


struct PriceGenerator {
    static func update(stock : Stock) -> Stock {
        var update = stock
        let change = Double.random(in: -2...2)
        update.previousPrice = update.currentPrice
        update.currentPrice? += change
        
        return update
    }
}
