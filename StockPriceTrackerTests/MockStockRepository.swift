//
//  MockStockRepository.swift
//  StockPriceTracker
//
//  Created by Nivi on 04/04/26.
//

import Foundation
import Combine
@testable import StockPriceTracker

final class MockStockRepository: StockRepository {

    private let subject = CurrentValueSubject<[Stock], Never>([])

    var stockPublisher: AnyPublisher<[Stock], Never> {
        subject.eraseToAnyPublisher()
    }

    var startCalled = false
    var stopCalled = false
    var sortOptionPassed: SortOption?

    func start() {
        startCalled = true
    }

    func stop() {
        stopCalled = true
    }

    func sort(by option: SortOption) {
        sortOptionPassed = option
    }

    func send(_ stocks: [Stock]) {
        subject.send(stocks)
    }
}
