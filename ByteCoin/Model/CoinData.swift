//
//  CoinData.swift
//  ByteCoin
//
//  Created by Nikita  on 9/4/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation


struct CoinData: Codable{
    let asset_id_base: String
    let asset_id_quote: String
    let rate: Double
}
