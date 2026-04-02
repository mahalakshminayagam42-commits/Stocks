//
//  StockMockData.swift
//  StockPriceTracker
//
//  Created by Nivi on 02/04/26.
//

extension Stock {
    static func mock() -> [Stock] {
        let symbols = [
            "AAPL", "GOOG", "TSLA","AMZN","MSFT",
            "NVD","META","NFLX","AMD","INTC",
            "BABA","ORCL","IBM","UBER","LYFT",
            "SHOP","SQ","PYPL","CRM","ADBE",
            "CSCO","QCOM","TXN","AVGO","SAP"
        ]
        
        return symbols.map{
            Stock(
                id: $0,
                symbol: $0,
                price: Double.random(in: 100...500),
                change: 0,
                description: "\($0) company description"
            )
        }
      
    }
}
