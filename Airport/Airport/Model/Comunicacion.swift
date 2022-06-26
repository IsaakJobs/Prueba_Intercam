//
//  Comunicacion.swift
//  Airport
//
//  Created by isaakjobs on 23/06/22.
//

import Foundation


public class Airports {
    
  
    private var name: [String] = []
    private var latitud: [Double] = []
    private var longitud: [Double] = []
   
    let defaultstitulos = UserDefaults.standard
   
    //se genera una variable para llamar al ViewController donde se encuentra el radioKm obtenido del slider, y las coordenadas Latitud, Longitud de la ubicacion del usuario
    let comunicacion = ViewController()
    
   
    //funcion que permite comunicar y extraer los datos devueltos por el servicio/servidor/api
    public func getData(){
        
    //se genera un url unico, inyectando los datos personalizados
        let urlString = "https://aviation-reference-data.p.rapidapi.com/airports/search?lat=\(comunicacion.RadioLocation.object(forKey: "latitud")!)&lon=\(comunicacion.RadioLocation.object(forKey: "longitud")!)&radius=\(comunicacion.RadioLocation.object(forKey: "Km")!)"
     
   
        //se desempaqueta de forma segura
    guard let url = URL(string:  urlString) else{
    return
    }
      
        
        //se genera un request con las credenciales de acceso al servicio/servidor/api con el que deseamos comunicarnos
        //forHTTPHeaderField, representaria al nombre del campo al que se llenaria con las credenciales obtenidas para el acceso
       var request = URLRequest(url: url)
        request.setValue("8b7c64078cmsh9bccfc423492e67p1c91cbjsn5f4d55f74e8f", forHTTPHeaderField:"X-RapidAPI-Key")
        request.setValue("aviation-reference-data.p.rapidapi.com", forHTTPHeaderField:"X-RapidAPI-Host")

    
        //se genera una sesion de comunicacion con el servicio/servidor/api para obtener una respuesta
        //data, obtiene la data que deseamos manipular en la aplicacion
        //response, obtiene el estado de comunicacion con el servicio/servidor/api
        //error, obtiene el error en la obtencion de la data
        let dataTask = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { [self] (data, response, error) -> Void in
           
            //se desempaqueta
            guard let data = data, error == nil else {
                return
            }
            guard response != nil else {
                return
            }
           
            //se comprubea el estado de comunicacion con el servicio/servidor/api
            // print(response)


 
            //se genera un do catch para hacer algo con el, data, response, error
            do{
                //se decodifica el json obtenido del servicio/servidor/api moldendolo por medio de nuestra estructura
                let result = try JSONDecoder().decode([AirportsData].self, from: data)
               
                //se añade la data especifica al arreglo correspondiente
                self.name.append(contentsOf: result.compactMap{ $0.name })
                self.longitud.append(contentsOf: result.compactMap{ $0.longitude })
                self.latitud.append(contentsOf: result.compactMap{ $0.latitude })
                
               //se guardan los arreglos en userdefaults para acceder a ellos desde otras clases
                self.defaultstitulos.set(self.name, forKey: "name")
                self.defaultstitulos.set(self.latitud,forKey: "latitude")
                self.defaultstitulos.set(self.longitud,forKey: "longitude")
                
                //con un print verificamos que existen datos
              //  print(defaultstitulos.object(forKey: "name"))
       
            }
            //se muestra el error
            catch let error{
                print("ERROR", error)
            }
        })
    
        dataTask.resume()
        

      
        
//se genera una estructura segun los datos que se conoce se obtienen de la comunicacion con el servicio/servidor/api
//se comentan los datos que no se requieren, dejando los que vamos a manipular
      struct AirportsData: Decodable {
       // var iataCode: String?
       //  var icaoCode: String?
       var name: String
       // var alpha2countryCode:String?
       var latitude: Double
       var longitude: Double

    
}
  
    }
    
}
  
