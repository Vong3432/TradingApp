//
//  TradingAppViewModel.swift
//  TradingApp
//
//  Created by Vong Nyuksoon on 08/03/2022.
//

import Foundation
import Combine

extension HomeView {
    class HomeViewModel: ObservableObject {
        @Published private(set) var price = 0.0
        
        private var priceService = TradePriceService()
        private var cancellable = Set<AnyCancellable>()
        
        init() {
            self.connect()
        }
        
        private func connect() {
            priceService.connect()
            
            priceService.$price
                .sink { [weak self] latestPrice in
                    DispatchQueue.main.async {
                        self?.price = latestPrice
                    }
                }.store(in: &cancellable)
        }
    }
}
