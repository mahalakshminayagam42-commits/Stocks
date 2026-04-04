//
//  ConnectionView.swift
//  StockPriceTracker
//
//  Created by Nivi on 03/04/26.
//

import SwiftUI

struct ConnectionStatusView: View {
    let state : ConnectionState
    
    var body: some View {
       
        HStack(spacing: 8) {
            Circle()
                .fill(statusColor)
                .frame(width: 10,height: 10)
            
            Text(statusText)
                .font(.subheadline.weight(.medium))
        }
    }
    
    private var statusText : String {
        switch state {
        case .connected:
            return "Connected"
        case .connecting:
            return "Connecting"
        case .disconnected:
            return "Disconnected"
        case .failed:
            return "Disconnected"
        }
    }
    
    private var statusColor : Color {
        switch state {
        case .connected:
            return .green
        case .connecting:
            return .orange
        case .disconnected, .failed:
            return .red
        }
    }
}
