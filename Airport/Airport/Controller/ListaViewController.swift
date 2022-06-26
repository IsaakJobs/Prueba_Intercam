//
//  ListaViewController.swift
//  Airport
//
//  Created by isaakjobs on 23/06/22.
//

import UIKit

class ListaViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tablaAirports: UITableView!
    
    //se declara constante para comunicar con la clase
    let comunicacion = Airports()
    //arreglos para almacenar los datos devueltos del servicio/servidor/api
    private var names: [String] = []
    private var latitude: [Double] = []
    private var longitude: [Double] = []
    
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //se recarga la tabla para visualisar los ultimos datos
        self.tablaAirports.reloadData()
        
        tablaAirports.dataSource = self
        tablaAirports.delegate = self
      
             //se guardan en arreglos los datos de los usedefaultstitulos de la clase Airports()
           names.append(contentsOf: comunicacion.defaultstitulos.object(forKey: "name") as! [String])
           latitude.append(contentsOf: comunicacion.defaultstitulos.object(forKey: "latitude") as! [Double])
           longitude.append(contentsOf: comunicacion.defaultstitulos.object(forKey: "longitude") as! [Double])
        //se termina de recargar la tabla
        self.tablaAirports.refreshControl?.endRefreshing()
        
        
    }
    
    


}
//se genera una extencion de la clase implementando el datasource y delegate de la tabla
extension ListaViewController: UITableViewDataSource,UITextFieldDelegate{
    
    //se inidica el numero de secciones que tendra la tabla
    func numberOfSections(in tableView: UITableView) -> Int {
      return 1
    }
    
    //numero de filas que tendra la tabla obtenidas de acuerdo al numero de datos del arreglo
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return names.count
    }
    //se genera una celda personalizada con los datos que deseamos poblar, remplazando la celda de la tabla original con
    //la personalizada que se encuentra en ListaAirportsTableViewrCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "descripcionCustomCell", for: indexPath) as? ListaAirportsTableViewrCell
       
        //se recorre de 1 en 1 el arreglo nombres y se añade al mismo pero en forma de string
        for i in 1...self.names.count{
            names.append(String(i))
        }
        
        //le indica a cada apartado de la celda que datos debe tener y poblarlos
        cell?.nombre?.text = self.names[indexPath.row]
        cell?.latitud?.text = "Latitud: \(String(self.latitude[indexPath.row]))"
        cell?.longitud?.text = "Longitud: \(String(self.longitude[indexPath.row]))"
        

        return cell!
    }
    //aqui permite realizar algo cuando se toca una celda de la tabla
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "descripcionCustomCell", for: indexPath) as? ListaAirportsTableViewrCell
        
      
       
        
    }

}
