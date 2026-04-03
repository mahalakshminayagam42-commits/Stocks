//
//  WebSocketServiceProtocol.swift
//  StockPriceTracker
//
//  Created by Nivi on 02/04/26.
//

import Foundation
import Combine

protocol WebSocketServiceProtocol {
    
    func connect()
    func disconnect()
    func send(message : String)
    
    var onMessagePublisher : AnyPublisher<String,Never> { get}
    var connectionStatus : AnyPublisher <Bool,Never> { get}
}
