//
//  ContentView.swift
//  Act03_MyFirstApp_A00824311
//
//  Created by Emiliano on 18/02/26.
//

import SwiftUI

struct ContentView: View {
    
    // Instanciamos el PokemonViewModel usando State
    @State private var pokemonVM = PokemonViewModel()
    
    // Deinimos el layout del grid fue del cuerpo para mejor lectura
    let columns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    var body: some View {
        // Vistas de Lista y Detalle
        NavigationStack {
            
            ZStack {
                
                LinearGradient(colors: [Color.red.opacity(0.15), Color(UIColor.systemGroupedBackground)], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                if pokemonVM.isLoading {
                    ProgressView("Buscando Pokémon")
                        .controlSize(.large)
                } else if let errorMsg = pokemonVM.errorMsg {
                    
                    VStack(spacing: 20) {
                        Image(systemName: "wifi.exclamationmark")
                            .font(.system(size: 50))
                            .foregroundStyle(.red)
                        
                        Text(errorMsg)
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                } else {
                    ScrollView {
                        
                        LazyVGrid(columns: columns, spacing: 15) {
                            ForEach(pokemonVM.arrPokemon) { item in
                                NavigationLink {
                                    PokemonDetailView(pokemon: item)
                                } label: {
                                    PokemonCardView(pokemon: item)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(15)
                    }
                }
            }
            .navigationTitle("Pokédex")
            .task {
                if pokemonVM.arrPokemon.isEmpty {
                    await pokemonVM.getPokemon()
                }
            }
        }
        .tint(.red)
    }
}


