//
//  PuntosMapController.swift
//  Airport
//
//  Created by isaakjobs on 23/06/22.
//

import UIKit
import MapKit
import CoreLocation


class PuntosMapController: UIViewController {

    @IBOutlet weak var MapView: MKMapView!
   
    let locationManager = CLLocationManager()
   
    //constante para acceder a la clase Airports dentro de Comunicacino.swift
    let comunicacion = Airports()

    //arreglos para guardas los datos obtnenidos
    private var name: [String] = []
    private var latitud: [Double] = []
    private var longitud: [Double] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
       
       //obtener el valor mas preciso de la ubicacion
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //reportar o monitorear el cambio de distancia en la ubicacion
        locationManager.distanceFilter = kCLDistanceFilterNone
       //comenzar a obtener la ubicacion actual
        locationManager.startUpdatingLocation()
        
       
        //se le indica al mapviw que muestra esta ubicacion
        MapView.showsUserLocation = true
     
     //se manda a llamar la funcion get.Data() para generar la comunicacion servicio/servidor/api y asi poder obtener la data
        comunicacion.getData()
        
         
      
       //se guarda los datos nombre,latitudes,longitudes en un respectivo arreglo
     self.name = comunicacion.defaultstitulos.object(forKey: "name") as! [String]
     self.latitud = comunicacion.defaultstitulos.object(forKey: "latitude") as! [Double]
    self.longitud = comunicacion.defaultstitulos.object(forKey: "longitude") as! [Double]
            
    
        
        //se crean los arreglos, y un arreglo de diccionarios: "locations"
        var locations:[[String:Any]] = []
        var arrayNombres:[String] = []
        var arrayLongitudes:[Double] = []
        var arrayLatitudes:[Double] = []
        
        
        //se aplica un ciclo for para reccorer los arreglos de userdesaultstitulos y almacenarlos en los nuevos arreglos
        
        for nombre in name {
          
            arrayNombres.append(nombre)
        }
        for latitude in latitud {
           
            arrayLatitudes.append(latitude)
        }
        for longitude in longitud {
        
            arrayLongitudes.append(longitude)
        }
        
      //este ultimo ciclo arroja el numero de elementos totales dentro de arrayNombres, limitando
     //que no exceda el limite
       
        for index in 0 ..< arrayLatitudes.count {
    
            //se moldea el arreglo de diccionarios, y se les indica el index para generar todos los datos
            //de los areglos de userdefaults
            
          locations = [["title": arrayNombres[index], "latitude": arrayLatitudes[index], "longitude": arrayLongitudes[index]]]
            
            //verificar que el resultado sea como el que deseamos obtener
        print(locations.description)
                
        
     //se aplica un ciclo for para generar el numero de puntos en el mapa de acuerdo a la cantidad de datos en el diccionario :"locations"
          
            for location in locations {
                let anotaciones = MKPointAnnotation()
                MapView.removeAnnotation(anotaciones)
               //se busca obtener en anotaciones.title todos los title del diccionario
                 anotaciones.title = location["title"] as? String
              //se busca obtener todas las coordenadas dentro del diccionario y que acuen del tipo CLLocationDegrees
               anotaciones.coordinate = CLLocationCoordinate2D(latitude: location["latitude"] as! CLLocationDegrees, longitude: location["longitude"] as! CLLocationDegrees)

              //una vez recorrido todo el diccionario y generado todos los titulos y las coordenadas, se muestran los puntos en el mapa pasando las anotaciones a la vista del mapa.
               MapView.addAnnotation(anotaciones)
            }
        }}}
    
           
 
        
        
    
    
    

