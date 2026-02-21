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
            
            ScrollView {
                
                // Usamos LazyVGrid para mejor uso de memoria
                LazyVGrid(columns: columns, spacing: 15) {
                    
                    //Iteramos del array de Pokémon que nos devuelve el ViewModel
                    ForEach(pokemonVM.arrPokemon) { item in
                        
                        //Manejo de la navegación de Lista a Detalle
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
            .navigationTitle("Pokédex")
            .background(
                LinearGradient(colors: [Color.red.opacity(0.15), Color(UIColor.systemGroupedBackground)], startPoint: .top, endPoint: .bottom)
            )
            //Llamada a la API
            .task {
                do {
                    //Llamamos a la función get para traernos la lista al momento de cargar la vista
                    try await pokemonVM.getPokemon()
                } catch {
                    // Manejo de error sencillo catcheando el error de una tarea asíncrona
                    print("Hubo un error al cargar la API")
                }
            }
        }
        .tint(.red)
    }
}


