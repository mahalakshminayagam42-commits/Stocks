//
//  StockPriceTrackerTests.swift
//  StockPriceTrackerTests
//
//  Created by Nivi on 04/04/26.
//

import Testing
@testable import StockPriceTracker

struct StockPriceTrackerTests {
    
    @Test
    @MainActor
    func testStockUpdate() async throws {
      
        let repo =  MockStockRepository()
        let vm =  SymbolsViewModel(repository: repo)
        
        let stock = Stock(symbol: "AAPL", name: "Apple",currentPrice: 100,previousPrice: 90, description: "Test")
        
        repo.send([stock])
        
        try await Task.sleep(nanoseconds: 100_000_000)
        
        #expect(vm.stocks.count == 1)
 
    }
    
    @Test
    @MainActor
    func testStartFeed() async throws {
        let repo =  MockStockRepository()
        let vm =  SymbolsViewModel(repository: repo)
        vm.toggleFeed()
        
        #expect(repo.startCalled == true)
        #expect(vm.isFeedRunning == true)
    }
    
    @Test
    @MainActor
    func testStopFeed() async throws {
        let repo = MockStockRepository()
        let vm = SymbolsViewModel(repository: repo)
        
        vm.connectionState = .connected
        
        vm.toggleFeed()
        
        #expect(repo.stopCalled ==  true)
        #expect(vm.isFeedRunning == false)
    }
    
    @Test
    @MainActor
    func testSortCalled() async throws {
        let repo = MockStockRepository()
        
        let vm = SymbolsViewModel(repository: repo)
        
        vm.updateSort(.change)
        
        #expect(repo.sortOptionPassed == .change)
    }

    
    @Test
    @MainActor
    func testSortingByPrice() async throws {
        let repo = MockStockRepository()
        let vm = SymbolsViewModel(repository: repo)
        
        let stocks = [
            Stock(symbol: "A", name: "", currentPrice: 100,previousPrice: 90,description: ""),
            Stock(symbol: "B", name: "",currentPrice: 200, previousPrice: 190, description: "")
        ]
        
        repo.send(stocks)
        vm.sortOption = .price
        
        #expect((vm.stocks.first?.currentPrice ?? 0) >= (vm.stocks.last?.currentPrice ?? 0))
    }
    
    @Test
    @MainActor
    
    func testSelectedStockAvailable() async throws {
        let repo = MockStockRepository()
        let vm = SymbolsViewModel(repository: repo)
        
        
        let stock = Stock(symbol: "AAPL", name: "Apple",currentPrice: 100,previousPrice: 90, description: "Test")
        
        repo.send([stock])
        
        for _ in 0..<10 {
                if vm.stocks.count == 1 { break }
                try await Task.sleep(nanoseconds: 50_000_000)
            }

            
        #expect(vm.stocks.count == 1)
    }
}
