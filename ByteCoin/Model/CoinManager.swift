//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "BDBEE28B-50F3-4302-9F1B-4FA105D0B312"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    
    func getCoinPrice(for currency: String){
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        //1
        guard let url = URL(string: urlString) else {return}
        //2
        let session = URLSession(configuration: .default)
        //3
        let task = session.dataTask(with: url) { data, response, error in
            guard error == nil else {return}
            guard let safeData = data else {return}
            guard let coinModel = parseJSON(data: safeData) else {return}
            print(coinModel.rate)
            
        }
        
        
        task.resume()
        
        
        
        
    }
    
    
    func parseJSON(data: Data) -> CoinModel?{
        let decoder = JSONDecoder()
        
        do{
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let coinModel = CoinModel(quoteCurrency: decodedData.asset_id_quote, rate: decodedData.rate)
            return coinModel
        }
        catch{
            print(error.localizedDescription)
            return nil
        }
    }

    
}
