//
//  ContentView.swift
//  TradingApp
//
//  Created by Vong Nyuksoon on 08/03/2022.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var vm = HomeViewModel()
    
    private let gradient = LinearGradient(
        colors: [
            .yellow,
            .orange
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    var body: some View {
        ZStack {
            gradient.ignoresSafeArea()
            
            VStack {
                Spacer()
                Image(systemName: "bitcoinsign.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.white)
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 18) {
                    Text("Live update")
                        .font(.title2)
                        .foregroundColor(.secondary)
                    Text(vm.price.toCurrency())
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .padding()
                .padding(.top)
                .frame(maxWidth: .infinity, minHeight:70, alignment: .leading)
                .background(.ultraThickMaterial)
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
