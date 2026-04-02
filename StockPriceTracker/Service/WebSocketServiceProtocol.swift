//
//  WebSocketServiceProtocol.swift
//  StockPriceTracker
//
//  Created by Nivi on 02/04/26.
//

import Foundation


protocol WebSocketServiceProtocol {
    
    func connect()
    func disconnect()
    func send(message : String)
    
    var onMessage : ((String) -> Void)? {get set}
    var onStatusChange : ((Bool) -> Void)? {get set}
}
