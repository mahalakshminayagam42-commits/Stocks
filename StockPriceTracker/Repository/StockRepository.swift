//
//  StockRepository.swift
//  StockPriceTracker
//
//  Created by Nivi on 03/04/26.
//

import Foundation
import Combine


enum SortOption : String,CaseIterable,Equatable,Identifiable {
    case price = "Price"
    case change = "Price Change"
    
    var id : String { rawValue }
}

protocol StockRepository {
    var stockPublisher : AnyPublisher<[Stock],Never>  { get }
    
    func start()
    func stop()
    func sort(by option : SortOption)
 }
