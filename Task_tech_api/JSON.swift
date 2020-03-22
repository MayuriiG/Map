//
//  JSON.swift
//  Task_tech_api
//
//  Created by Mayurii Gajbhiye on 06/03/20.
//  Copyright © 2020 q. All rights reserved.
//

import UIKit

class JsonSerialize: NSObject{


    var URLReqObj:URLRequest!
    var dataTaskObj:URLSessionDataTask!

    static var delegateDatas : JsonSerialize  = JsonSerialize()
    //plist code...(added)
        
        
        
//.................function for dataPassing..................
        
        
    func loginDetails() ->[String:Any]{

    var convertedData:[String:Any]!
    
    URLReqObj = URLRequest(url:URL(string:"http://tech599.com/tech599.com/johngov/partyquest/services/api_get_all_events.php")!)
        
        
 //http://tech599.com/tech599.com/johngov/partyquest/photos/flyers/1500459140569267882test.jpg
 //http://tech599.com/tech599.com/johngov/partyquest/photos/flyers/1527229233748366458IMG_20180524_132315050.jpg
   
        
    URLReqObj.httpMethod = "GET"

    dataTaskObj = URLSession.shared.dataTask(with: URLReqObj, completionHandler: {( data, connDetails , err) in

            print("got data from server")

        do{

            convertedData = try (JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as![String:Any])

            print(convertedData)

               }

               catch{

                   print("Something went wrong")

               }

           })

           dataTaskObj.resume()
             
        while convertedData == nil {
                              
            }
                           
                  return convertedData


             }
      
        
        
    }

