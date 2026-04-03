//
//  WebSocketService.swift
//  StockPriceTracker
//
//  Created by Nivi on 02/04/26.
//

import Foundation
import Combine


final class WebSocketService : WebSocketServiceProtocol {
    private var task : URLSessionWebSocketTask?
    private let subject = PassthroughSubject<String,Never>()
    private let statusSubject = CurrentValueSubject<Bool,Never>(false)
    

    var onMessagePublisher: AnyPublisher<String, Never> {
        subject.eraseToAnyPublisher()
    }
    
    var connectionStatus : AnyPublisher<Bool,Never> {
        statusSubject.eraseToAnyPublisher()
    }
    
    func connect() {
        
        print("Connecting")
        
        guard let url = URL(string: "wss://ws.postman-echo.com/raw") else { return }
            
            task = URLSession.shared.webSocketTask(with: url)
            task?.resume()
            
            statusSubject.send(true)
        
         print(" WebSocket Connected")

        
            receive()
        }
        
        func disconnect() {
            task?.cancel()
            statusSubject.send(false)
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
                    self?.subject.send(text)
                    
                case .failure(let error):
                    print("Receive error :",error)
                    
                default:
                    break
                }
                self?.receive()
                
            }
        }
    }

