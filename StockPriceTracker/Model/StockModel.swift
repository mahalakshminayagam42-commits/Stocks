//
//  StockModel.swift
//  StockPriceTracker
//
//  Created by Nivi on 02/04/26.
//

import Foundation


struct Stock : Identifiable, Equatable {
    let id : String?
    let symbol : String?
    var price : Double?
    var change : Double?
    let description : String?
}



