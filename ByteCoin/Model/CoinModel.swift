//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Nikita  on 9/4/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation




struct CoinModel{
    let baseCurrency: String = "BTC"
    let quoteCurrency: String
    let rate: Double
    
    
    var rateString: String {
        return String(round(rate * 1000) / 1000.0)
        
    }
}
