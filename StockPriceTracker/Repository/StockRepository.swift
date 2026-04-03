//
//  StockRepository.swift
//  StockPriceTracker
//
//  Created by Nivi on 03/04/26.
//

import Foundation
import Combine


enum SortOption {
    case price
    case change
}

protocol StockRepository {
    var stockPublisher : AnyPublisher<[Stock],Never>  { get }
    
    func start()
    func stop()
    func sort(by option : SortOption)
 }
