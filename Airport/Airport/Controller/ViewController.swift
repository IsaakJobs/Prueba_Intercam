//
//  ViewController.swift
//  Airport
//
//  Created by isaakjobs on 23/06/22.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var RadioKm: UILabel!
    @IBOutlet weak var SliderKm: UISlider!
   
    //constante para instanciar locationmanager
    let locationManager = CLLocationManager()
    //para almacenar datos locales y acceder a ellos desde otras clases
    let RadioLocation = UserDefaults.standard
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        //para solicitar autorizacion del usuario para usar el gps
                locationManager.requestWhenInUseAuthorization()
                locationManager.requestAlwaysAuthorization()
        
        
        //se inidica al slider que inice en valor de 0
        SliderKm.minimumValue = 0
        //se indica radiokm que obtenga el valor del slider (que lo comvierte a Int) para comvertirlo a String
        RadioKm.text = String(Int(SliderKm.value))
    
      

        
    }
    
    
    @IBAction func SliderCambio(_ sender: Any) {
        //se le indica al slider el valor maximo al que puede llegar
        SliderKm.maximumValue = 100
        //se indica radiokm que obtenga el valor del slider (que lo comvierte a Int) para comvertirlo a String
        RadioKm.text = String(Int(SliderKm.value))
        //se guarda el valor del radiokm en userdesaults
        self.RadioLocation.set(RadioKm.text, forKey: "Km")
       //verificamos que se obtenga el valor
        print("RadioKM: \(RadioKm.text)")
 
        //declara variable donde se indica que locationmanager y su location, actuen como un objeto del tipo Cllocation para obtener solo la latitud y longitud
        let cordenadas = locationManager.location! as CLLocation
        //variables que almacenan idividualmemte la longitud y latitud
               let latitud = cordenadas.coordinate.latitude
               let longitud = cordenadas.coordinate.longitude
        //se guarda las variables longitud y latitud en userdefaults
                self.RadioLocation.set(latitud, forKey: "latitud")
                self.RadioLocation.set(longitud, forKey: "longitud")
        //verificamos que se obtenga el valor
        print("COORDENADAS: \(latitud),\(longitud)")
        //llamamos a getData para obtener los datos de posiscion del usuario
        let com = Airports()
        com.getData()
        
    }
    
    
    
    @IBAction func Buscarbtn(_ sender: Any) {
      //al llamar nuevavente a getdata al activar el botton nos aseguramos que getdata trajo los ultomos valroes de la unicacion actual
        let com = Airports()
        com.getData()
        
        
    }
    
   
}

