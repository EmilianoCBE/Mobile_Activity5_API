# Pokédex App

## ¿Qué hace esta app?
Esta es una aplicación de iOS de una Pokédex, construida con SwiftUI usando la arquitectura MVVM. Muestra una lista de Pokémon acomodados en un grid (cuadrícula) de 2 columnas. Si tocas la tarjeta de algún Pokémon, te lleva a una vista de detalle donde puedes ver una imagen, su número de Pokédex y una breve descripción.

También le agregué manejo de errores para que la app no se cierre de la nada. Mientras descarga la información, muestra un indicador visual (una ruedita de carga). Si te quedas sin internet, te avisa con un mensaje amigable, y si la conexión falla, muestra un error fácil de entender.

## API utilizada
La aplicación se conecta a la API pública y gratuita **PokéAPI** para descargar la información:
* **Endpoint utilizado:** `https://pokeapi.co/api/v2/pokemon?limit=100`
* Las imágenes se descargan automáticamente usando las URLs oficiales que genera el modelo a partir de los datos de la PokeAPI.

## Cómo correr la app
1. **Requisitos:**
   * Xcode 15.0 o superior.
   * iOS 17.0 o superior.
   
2. **Pasos:**
   * Descarga la carpeta del proyecto o clona este repositorio en tu Mac.
   * Abre el archivo 'Mobile_Activity5_API_A00824311' usando Xcode.
   * Selecciona un simulador en la parte superior (por ejemplo, iPhone 17 Pro).
   * Presiona `Cmd + R` o dale clic al botón de **Play** para compilar y correr la aplicación.
   * Asegúrate de que tu Mac o el simulador tengan conexión a internet para que puedan descargar los datos de los Pokémon, de lo contrario verás la pantalla de error.
