//
//  Funcion.swift
//  dsy
//
//  Created by Alfredo Luco on 24-02-17.
//  Copyright © 2017 Dsarhoya. All rights reserved.
//

import Foundation

class Funcion {
    
    //MARK: - Properties
    
    private var Id: String
    public var Date: String
    private var Price: String
    
    //init
    
    init(id: String, date:String, price:String) {
        self.Id = id
        self.Date = date
        self.Price = price
    }
    
    //MARK: - Getter methods
    
    public func getId()->String{
        return self.Id
    }
    
    public func getDate()->String{
        
        //get the original date
        let originalDate: String = self.Date
        
        //set the first date formatter
        let dateformatter1 = DateFormatter()
        dateformatter1.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        //transform it into a date
        let date = dateformatter1.date(from: originalDate)
        
        //set the second date formatter
        let dateformatter2 = DateFormatter()
        dateformatter2.dateFormat = "HH:mm"
        
        //transform it into a string
        let date2 = dateformatter2.string(from: date!)
        
        return date2
    }
    
    public func getPrice()->String{
        return self.Price
    }
    
}
