//
//  AppManager.swift
//  dsy
//
//  Created by Alfredo Luco on 24-02-17.
//  Copyright © 2017 Dsarhoya. All rights reserved.
//

import Foundation
class AppManager{
    
    //init
    init(){}
    
    //Methods
    
    //MARK: - Get events data
    
    public func getEvents(events: [Event])->[Event]{
        
        var eventstopush:[Event] = []
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        for i in events{
            if let fecha = i.getFunciones().first?.Date{
                print(fecha)
                
                let formatter2 = DateFormatter()
                formatter2.dateFormat = "yyyy-MM-dd"
                let date2 = formatter.date(from: fecha)
                
                if(formatter2.string(from: date2!) == formatter2.string(from: date)){
                    eventstopush.append(i)
                }
            }
            
        }
        return eventstopush
    }
    
}
