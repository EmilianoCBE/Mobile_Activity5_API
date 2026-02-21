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
    
    // Vaiables de control de la UI
    var isLoading = false
    var errorMsg: String?  = nil
    
    // Función encargada de descargar y decodificar la lista principal
    func getPokemon() async {
        
        //Reinicio de variables de control
        isLoading = true
        errorMsg = nil
        
        // Endpoint PokeAPI
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=100") else {
            isLoading = false
            errorMsg = "URL Inválida"
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        do {
            
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            // Corroboramos que la conexión sea exitosa
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                
                isLoading = false
                errorMsg = "Server Error, try again later"
                
                return
            }
            
            // Decodificamos la respuesta JSON
            let pokeResponse = try JSONDecoder().decode(PokeAPIResponse.self, from: data)
            self.arrPokemon = pokeResponse.results
            
            // Apagamos el estado de carga al obtener la información
            isLoading = false
            
        } catch let error as URLError where error.code == .notConnectedToInternet {
            // Cachamos el error de falta de conexión
            isLoading = false
            errorMsg = "No hay conexión a Internet"
        } catch {
            // Cachamos cualquier otro error 
            isLoading = false
            errorMsg = "Error al cargar la información. \(error.localizedDescription)"
        }
        
    }
}

