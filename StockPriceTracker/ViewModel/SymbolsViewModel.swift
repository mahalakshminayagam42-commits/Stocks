//
//  SymbolsViewModel.swift
//  StockPriceTracker
//
//  Created by Nivi on 03/04/26.
//

import Foundation
import Combine

enum ConnectionState : Equatable {
    case disconnected
    case connecting
    case connected
    case failed(String)
}

@MainActor
final class SymbolsViewModel : ObservableObject {
    @Published var stocks : [Stock] = []
    @Published var sortOption : SortOption = .price {
        didSet {
            applySort()
        }
    }
    @Published var connectionState : ConnectionState = .disconnected
    @Published var isFeedRunning = false
    
    private let repository: StockRepository
    private var cancellables = Set<AnyCancellable>()

    init(repository: StockRepository) {
            self.repository = repository

            repository.stockPublisher
                .receive(on: DispatchQueue.main)
                .assign(to: &$stocks)
        }
    
    func toggleFeed() {
        if connectionState == .connected {
            repository.stop()
            connectionState = .disconnected
            isFeedRunning  = false
        }
        else {
            repository.start()
            connectionState = .connected
            isFeedRunning = true
        }
    }
    
    func updateSort(_ option : SortOption) {
        repository.sort(by: option)
    }
    
    
    private func applySort() {
        switch sortOption {
        case .price:
            stocks.sort {$0.currentPrice ?? 0 > $1.currentPrice ?? 0}
        case .change:
            stocks.sort { abs($0.priceChange) > abs($1.priceChange)}
        }
    }
}
