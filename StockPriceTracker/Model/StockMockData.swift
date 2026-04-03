//
//  StockMockData.swift
//  StockPriceTracker
//
//  Created by Nivi on 02/04/26.
//

import Foundation

enum StockSeedData {
    static let stocks: [Stock] = [
        Stock(symbol: "AAPL", name: "Apple", currentPrice: 212.10, previousPrice: 210.00, description: "Consumer electronics company."),
        Stock(symbol: "GOOG", name: "Alphabet", currentPrice: 174.25, previousPrice: 176.10, description: "Search and cloud company."),
        Stock(symbol: "TSLA", name: "Tesla", currentPrice: 189.44, previousPrice: 184.20, description: "Electric vehicle company."),
        Stock(symbol: "AMZN", name: "Amazon", currentPrice: 181.82, previousPrice: 182.40, description: "E-commerce and cloud company."),
        Stock(symbol: "MSFT", name: "Microsoft", currentPrice: 428.50, previousPrice: 421.90, description: "Software and cloud company."),
        Stock(symbol: "NVDA", name: "NVIDIA", currentPrice: 903.35, previousPrice: 891.00, description: "AI and GPU company."),
        Stock(symbol: "META", name: "Meta", currentPrice: 502.70, previousPrice: 506.50, description: "Social media and VR company."),
        Stock(symbol: "NFLX", name: "Netflix", currentPrice: 611.43, previousPrice: 607.11, description: "Streaming platform."),
        Stock(symbol: "AMD", name: "AMD", currentPrice: 171.62, previousPrice: 170.10, description: "Chipmaker company."),
        Stock(symbol: "INTC", name: "Intel", currentPrice: 41.26, previousPrice: 42.31, description: "Semiconductor company."),
        Stock(symbol: "ORCL", name: "Oracle", currentPrice: 129.48, previousPrice: 127.90, description: "Enterprise software company."),
        Stock(symbol: "CRM", name: "Salesforce", currentPrice: 297.17, previousPrice: 301.22, description: "CRM platform."),
        Stock(symbol: "ADBE", name: "Adobe", currentPrice: 518.99, previousPrice: 515.31, description: "Creative software company."),
        Stock(symbol: "UBER", name: "Uber", currentPrice: 77.80, previousPrice: 76.15, description: "Mobility platform."),
        Stock(symbol: "SHOP", name: "Shopify", currentPrice: 82.14, previousPrice: 79.55, description: "Commerce platform."),
        Stock(symbol: "PYPL", name: "PayPal", currentPrice: 67.40, previousPrice: 68.90, description: "Payments platform."),
        Stock(symbol: "SQ", name: "Block", currentPrice: 79.01, previousPrice: 77.75, description: "Financial technology company."),
        Stock(symbol: "BABA", name: "Alibaba", currentPrice: 75.66, previousPrice: 74.80, description: "Commerce and cloud company."),
        Stock(symbol: "SONY", name: "Sony", currentPrice: 85.21, previousPrice: 86.04, description: "Electronics and entertainment company."),
        Stock(symbol: "SAP", name: "SAP", currentPrice: 194.31, previousPrice: 193.10, description: "Business software company."),
        Stock(symbol: "IBM", name: "IBM", currentPrice: 196.02, previousPrice: 194.72, description: "Enterprise technology company."),
        Stock(symbol: "QCOM", name: "Qualcomm", currentPrice: 169.10, previousPrice: 168.25, description: "Wireless technology company."),
        Stock(symbol: "AVGO", name: "Broadcom", currentPrice: 1321.11, previousPrice: 1315.32, description: "Semiconductor company."),
        Stock(symbol: "ASML", name: "ASML", currentPrice: 938.44, previousPrice: 940.08, description: "Chip equipment company."),
        Stock(symbol: "ARM", name: "Arm Holdings", currentPrice: 124.35, previousPrice: 122.60, description: "Processor design company.")
    ]
}
