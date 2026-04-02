//
//  WebSocketService.swift
//  StockPriceTracker
//
//  Created by Nivi on 02/04/26.
//

import Foundation


final class WebSocketService : WebSocketServiceProtocol {
    private var task : URLSessionWebSocketTask?
    
    var onMessage: ((String) -> Void)?
    var onStatusChange: ((Bool) -> Void)?
    
    func connect() {
        
        guard let url = URL(string: "wss://ws.postman-echo.com/raw") else { return }
            
            task = URLSession.shared.webSocketTask(with: url)
            task?.resume()
            
            onStatusChange?(true)
            
            receive()
        }
        
        func disconnect() {
            task?.cancel()
            onStatusChange?(false)
        }
        
        func send(message : String) {
            task?.send(.string(message)) {error in
                if let error = error {
                    print("Send error : ",error)
                }
                
            }
        }
        
        private func receive() {
            task?.receive {[weak self] result in
                switch result {
                case .success(.string(let text)):
                    self?.onMessage?(text)
                    
                case .failure(let error):
                    print("Receive error :",error)
                    
                default:
                    break
                }
                self?.receive()
                
            }
        }
    }

