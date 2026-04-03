//
//  StockModel.swift
//  StockPriceTracker
//
//  Created by Nivi on 02/04/26.
//

import Foundation

struct Stock : Identifiable, Equatable {
    let id : String?
    let symbol : String?
    let name : String?
    let description : String?
    var currentPrice : Double?
    var previousPrice : Double?
    
    init(symbol: String?, name: String?, currentPrice: Double? = nil, previousPrice: Double? = nil, description: String?) {
        self.id = symbol
        self.symbol = symbol
        self.name = name
        self.description = description
        self.currentPrice = currentPrice
        self.previousPrice = previousPrice
    }
    
    
    var priceChange: Double {
        (currentPrice ?? 0) - (previousPrice ?? 0 )
    }
    
    var isPositive : Bool {
        priceChange >= 0
    }
}



