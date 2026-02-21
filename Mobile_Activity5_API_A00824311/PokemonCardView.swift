//
//  PokemonCardView.swift
//  Act03_MyFirstApp_A00824311
//
//  Created by Emiliano on 18/02/26.
//

import SwiftUI

struct PokemonCardView: View {
    let pokemon: Pokemon
    
    var body: some View {
        VStack {
            AsyncImage(url: pokemon.imageUrl) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder : {
                ProgressView()
            }
            .frame(width: 90, height: 90)
            .padding(.top, 10)
            
            VStack(spacing: 4) {
                Text(pokemon.name.capitalized)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(.primary)
                
                Text("# \(pokemon.pokedexNumber)")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
            }
            .padding(.bottom, 15)
        }
        .frame(maxWidth: .infinity)
        .background(Color(UIColor.secondarySystemGroupedBackground))
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
    }
}

#Preview {
    
    PokemonCardView(pokemon: Pokemon(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/"))
        .frame(width: 160)
    
}
