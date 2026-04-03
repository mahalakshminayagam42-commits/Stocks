//
//  FeedControlButton.swift
//  StockPriceTracker
//
//  Created by Nivi on 03/04/26.
//

import SwiftUI

struct FeedControlButton: View {
    let isRunning : Bool
    let action: () -> Void
    
    var body: some View {
      
        Button(isRunning ? "Stop Feed" : "Start Feed" , action: action)
            .buttonStyle(.borderedProminent)
    }
}


