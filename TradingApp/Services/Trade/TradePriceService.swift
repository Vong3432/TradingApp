//
//  TradePriceService.swift
//  TradingApp
//
//  Created by Vong Nyuksoon on 08/03/2022.
//

import Foundation
import Combine

class TradePriceService: ObservableObject {
    @Published private(set) var price = 0.0
    
    private let urlSession = URLSession(configuration: .default)
    private let url = URL(string: "wss://ws.finnhub.io?token=xxx")!
    
    private var websocketTask: URLSessionWebSocketTask?
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        ping()
    }
    
    private func ping() {
        websocketTask?.sendPing { error in
            if error != nil {
                print("PING CHECKED ERR: \(error!.localizedDescription)")
            } else {
                print("PING CHECKED SUCCEESS")
            }
        }
    }
    
    func stop() {
        websocketTask?.cancel(with: .goingAway, reason: nil)
    }
    
    func connect() {
        stop()
        
        websocketTask = urlSession.webSocketTask(with: url)
        websocketTask?.resume()
        
        ping()
        
        sendMessage()
        receiveMessage()
    }
    
    private func sendMessage() {
        let string = "{\"type\":\"subscribe\",\"symbol\":\"BINANCE:BTCUSDT\"}"
        let message = URLSessionWebSocketTask.Message.string(string)
        
        Task {
            do {
                try await websocketTask?.send(message)
            } catch {
                print("ERROR: \(error.localizedDescription)")
            }
        }
    }
    
    private func receiveMessage() {
        Task {
            do {
                guard let message = try await websocketTask?.receive() else { return }
                
                switch message {
                case .data(let data):
                    print("Data: \(data)")
                case .string(let str):
                    if let decoded = try? JSONDecoder().decode(FinnHubAPIResponse.self, from: Data(str.utf8)) {
                        print("Decoded: \(decoded)")
                        self.price = decoded.data[0].p
                    }
                @unknown default:
                    fatalError()
                }
                
                self.receiveMessage()
                
            } catch {
                print("ERROR: \(error.localizedDescription)")
            }
        }
    }
}
