//
//  NextViewController.swift
//  Task_tech_api
//
//  Created by Mayurii Gajbhiye on 06/03/20.
//  Copyright © 2020 q. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps

class NextViewController: UIViewController ,GMSMapViewDelegate{

    
     var arraReload = [String:String]()
    
    var eventName:String!
    var eventVenue:String!
    var eventAddre:String!
    var eventEndDate:String!
    var eventStartDate:String!
    var eventDesc:String!
    var eventStartTime:String!
    
    var marker = GMSMarker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        MapDisplay()
     print(arraReload)

    }
    
    
    
    func MapDisplay(){
        
        
        let latitude = Double(arraReload["lat"]!)
        let longitude = Double(arraReload["long1"]!)
        
        eventName = arraReload["event_name"]
        eventVenue = arraReload["event_venue"]
        eventAddre = arraReload["address"]
        eventEndDate = arraReload["end_date"]
        eventStartDate = arraReload["start_date"]
        eventDesc = arraReload["description"]
        eventStartTime = arraReload["start_time"]
        
        GMSServices.provideAPIKey("AIzaSyAVmB4CU7lx_3XQy2quHf6to5TgY39uvSw")
                  
   
        // Create a GMSCameraPosition that tells the map to display the
     //   let camera = GMSCameraPosition.camera(withLatitude: 54.767388, longitude: -101.855503, zoom: 10.0)
        
        
        let camera = GMSCameraPosition.camera(withLatitude: latitude!, longitude: longitude!, zoom: 10.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.delegate = self
        
                 view = mapView

        // Creates a marker in the center of the map.
                  marker = GMSMarker()
                   marker.position = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
                  marker.title = eventName
                marker.snippet = eventVenue
                marker.map = mapView

    }
    
    
    
    //Notation Display on Map
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        
    let view = UIView(frame: CGRect.init(x: 0, y: 0, width: 200, height: 110))
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.cornerRadius = 13

        
        
        //Title...............
        let title = UILabel(frame: CGRect.init(x: 8, y: 8, width: view.frame.width-16, height: 26))//8+26 = 34

        title.text = "Event - \(eventName!)"
        title.font = UIFont(name: "Bodoni 72", size: 18.0) // set
        title.textAlignment = .center
        
        view.addSubview(title)

        
        //EventTime...............
        let eventTim = UILabel(frame: CGRect.init(x: 108, y: 40, width:view.frame.width-100, height: 20))//8+26

         eventTim.text = "Time - \(eventStartTime!)"
         eventTim.font = UIFont(name: "Bodoni 72", size: 12.0) // set
         eventTim.textAlignment = .left
              
          view.addSubview(eventTim)
        
        
        //EventTDate...............
        let eventDate = UILabel(frame: CGRect.init(x: 8, y: 40, width:view.frame.width-100, height: 20))//8+26    //100+8

         eventDate.text = "Date - \(eventStartDate!)"
         eventDate.font = UIFont(name: "Bodoni 72", size: 12.0) // set
        eventDate.textAlignment = .left
                   
         view.addSubview(eventDate)
         
        //EventTDescription...............
        let eventDescr = UILabel(frame: CGRect.init(x: 8, y: 60, width:view.frame.width-16, height: 20))//8+26    //100+8

        eventDescr.text = "\(eventDesc!)"
         eventDescr.font = UIFont(name: "Times New Roman", size: 13.0) // set
         eventDescr.textAlignment = .center
                          
         view.addSubview(eventDescr)
        
        
        //Start_time
         //address...............
         let address = UILabel(frame: CGRect.init(x: 8, y: 80, width: view.frame.width-16, height: 30)) //

         address.text = eventAddre
         address.font = UIFont(name: "Bodoni 72", size: 14.0) // set //Times New Roman
         address.textColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
         address.textAlignment = .center
         address.numberOfLines = 0

         view.addSubview(address)


        
          return view

                

            }
    
    }

   //data from server......................
   
//miley office
//["event_venue": "walnut st", "to_age": "80", "color": "http://tech599.com/tech599.com/johngov/partyquest/photos/stars/red_star.png", "end_time": "2017-07-20", "post_event_id": "2", "from_age": "20", "lat": "30.620393", "address": "1095 s walnut st loxley al 36551", "end_date": "2017-07-20", "user_id": "16", "event_name": "miley office", "long1": ."-87.756458", "description": "miley office inauguration", "event_flyer": "http://tech599.com/tech599.com/johngov/partyquest/photos/flyers/1500457390375611891test.jpg", "start_date": "2017-07-20", "start_time": "17:11 PM"]
