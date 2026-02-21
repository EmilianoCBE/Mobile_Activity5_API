//
//  PokemonDetailView.swift
//  Act03_MyFirstApp_A00824311
//
//  Created by Emiliano on 18/02/26.
//

import SwiftUI

struct PokemonDetailView: View {
    let pokemon : Pokemon
    
    var body : some View {
        ScrollView {
            VStack(spacing: 0) {
                ZStack {
                    Color.gray.opacity(0.15)
                        .frame(height: 320)
                    
                    AsyncImage(url: pokemon.imageUrl) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 10)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 250)
                }
                .edgesIgnoringSafeArea(.top)
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    HStack {
                        Text(pokemon.name.capitalized)
                            .font(.system(size: 36, weight: .black, design: .rounded))
                        
                        Spacer()
                        
                        Text("#\(pokemon.pokedexNumber)")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(.gray)
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("About")
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Text("This is a wild \(pokemon.name.capitalized)")
                            .font(.body)
                            .foregroundStyle(.secondary)
                            .lineSpacing(5)
                    }
                    
                    Spacer()
                }
                .padding(30)
                .background(Color(UIColor.systemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 35))
                .offset(y: -40)
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    PokemonDetailView(pokemon: Pokemon(name: "pikachu", url: "https://pokeapi.co/api/v2/pokemon/25/"))
}
