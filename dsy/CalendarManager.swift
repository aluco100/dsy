//
//  CalendarManager.swift
//  dsy
//
//  Created by Alfredo Luco on 24-02-17.
//  Copyright © 2017 Dsarhoya. All rights reserved.
//

import Foundation
import Alamofire

class CalendarManager {
    
    //MARK: - Properties
    
    private var BaseURL: String
    
    
    //MARK: - Initializer
    
    init(baseURL: String) {
        
        //init with base URL api or something like this
        
        self.BaseURL = baseURL
        
    }
    
    //Methods
    
    //MARK: - Get Events
    
    public func getEvents(url: String, onSuccess: @escaping ([Event])->Void){
        
        //Array of events
        
        var events: [Event] = []
        
        //get the complete url
        
        let completeURL: String = "\(self.BaseURL)\(url)"
        
        Alamofire.request(completeURL, method: .get, parameters: nil).responseJSON(completionHandler: {
            
            response in
            
            //prints data
            
            if let data: NSArray = response.result.value as? NSArray{
                
                for event in data{
                    
                    if let evento: NSDictionary = event as? NSDictionary{
                        
                        var funciones: [Funcion] = []
                        
                        if let arr = evento["funciones"] as? NSArray{
                            
                            for i in arr{
                                
                                if let funcionaux: NSDictionary = i as? NSDictionary{
                                    
                                    let funcionfinal = Funcion(id: funcionaux["id"] as! String, date: funcionaux["date"] as! String, price: funcionaux["price"] as! String)
                                    
                                    funciones.append(funcionfinal)
                                }
                                
                            }
                            
                        }
                        
                        if let id = evento["id"] as? String, let category = evento["category_name"] as? String, let title = evento["title"] as? String,let catId = evento["category_id"] as? String{
                            
                            let newEvent = Event(id: id, category: category, catId: catId, title: title, funciones: funciones)
                            events.append(newEvent)
                            
                        }
                        
                    }
                    
                    
                }
                
            }
            onSuccess(events)
        })
        
    }
    
}
