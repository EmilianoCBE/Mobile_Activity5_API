//
//  PokemonViewModel.swift
//  Act03_MyFirstApp_A00824311
//
//  Created by Emiliano on 18/02/26.
//

import Foundation

@MainActor
@Observable
class PokemonViewModel {
    
    // Inicializamos el arreglo vacío de tipo Pokémon
    var arrPokemon = [Pokemon]()
    
    // Función encargada de descargar y decodificar la lista principal
    func getPokemon() async throws {
        
        // Endpoint PokeAPI
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=20") else {
            print("Invalid URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        // Corroboramos que la conexión sea exitosa
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            print("Server error. Try again later")
            return
        }
        
        
        do {
            let pokeRespone = try JSONDecoder().decode(PokeAPIResponse.self, from: data)
            
            // Asignamos la lista de Pokémon a nuestro arreglo
            self.arrPokemon = pokeRespone.results
            
        } catch {
            print("Error al decodificar: \(error)")
        }
        
    }
}

