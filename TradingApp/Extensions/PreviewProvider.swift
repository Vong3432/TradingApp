//
//  PreviewProvider.swift
//  TradingApp
//
//  Created by Vong Nyuksoon on 08/03/2022.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    static let instance = DeveloperPreview()
    
    private init() {} // prevent other to init a new instance of this class
    
//    static let mockStocks = [
//        Stock(currency: "USD", description: "APPLE INC", displaySymbol: "AAPL", figi: "BBG000B9Y5X2", mic: "XNGS", symbol: "AAPL", type: "Common Stock"),
//        Stock(currency: "USD", description: "UAN POWER CORP", displaySymbol: "UPOW", figi: "BBG000BGHYF2", mic: "OTCM", symbol: "UPOW", type: "Common Stock")
//    ]
//    
//    static let mockTradePrice = [
//        FinnHubAPIResponse(data: [FinnHubAPIResponse.FinnHubData(p: 38746.87, s: "BINANCE:BTCUSDT", t: 1646728096692, v: 0.00049)], type: "trade"),
//        FinnHubAPIResponse(data: [FinnHubAPIResponse.FinnHubData(p: 38746.87, s: "BINANCE:BTCUSDT", t: 1646728096692, v: 0.00049)], type: "trade"),
//        FinnHubAPIResponse(data: [FinnHubAPIResponse.FinnHubData(p: 38746.87, s: "BINANCE:BTCUSDT", t: 1646728096692, v: 0.00049)], type: "trade"),
//    ]

}
