//
//  StockRepositoryDetail.swift
//  StockPriceTracker
//
//  Created by Nivi on 03/04/26.
//
import Foundation
import Combine

final class StockRepositoryDetail: StockRepository {


    private let webSocket: WebSocketService
    private var stocks: [Stock] = []
    private let subject = CurrentValueSubject<[Stock], Never>([])
    private var cancellables = Set<AnyCancellable>()
    private var sortOption: SortOption = .price

    init(webSocket: WebSocketService) {
        self.webSocket = webSocket
        setup()
    }
    
    
    var stockPublisher: AnyPublisher<[Stock], Never> {
        subject.eraseToAnyPublisher()
    }
    
    func start() {
        webSocket.connect()

        Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.webSocket.send(message: "update")
            }
            .store(in: &cancellables)
    }

    func stop() {
        webSocket.disconnect()
    }

    func sort(by option: SortOption) {
        sortOption = option
        publish()
    }

    private func setup() {
        stocks = Stock.mock()

        webSocket.onMessagePublisher
            .sink { [weak self] _ in
                self?.updateStock()
            }
            .store(in: &cancellables)

        publish()
    }

    private func updateStock() {
        guard let index = stocks.indices.randomElement() else { return }
        stocks[index] = PriceGenerator.update(stock: stocks[index])
        publish()
    }

    private func publish() {
        let sorted: [Stock]

        switch sortOption {
        case .price:
            sorted = stocks.sorted { $0.price ?? 0.0 > $1.price ?? 0.0 }
        case .change:
            sorted = stocks.sorted { $0.change ?? 0.0 > $1.change ?? 0.0 }
        }

        subject.send(sorted)
    }
}
