//
//  FinnHubAPIResponse.swift
//  TradingApp
//
//  Created by Vong Nyuksoon on 08/03/2022.
//

/**
 Finnhub API Response:
 {
    "data": [
    {
        "p":7296.89,
        "s":"BINANCE:BTCUSDT",
        "t":1575526691134,
        "v":0.011467
    }],
    "type":"trade"
}
 */

import Foundation

struct FinnHubAPIResponse: Codable {
    let data: [FinnHubData]
    let type: String
    
    struct FinnHubData: Codable {
        let p: Double
        let s: String
        let t: Int
        let v: Double
    }
}

