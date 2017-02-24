//
//  Event.swift
//  dsy
//
//  Created by Alfredo Luco on 24-02-17.
//  Copyright © 2017 Dsarhoya. All rights reserved.
//

import Foundation

class Event {
    
    //MARK: - Properties
    
    private var Id: String
    private var Category_id: String
    private var Category_name: String
    private var Title: String
    private var Funciones: [Funcion]
    
    //init
    
    init(id: String, category:String,catId:String,title:String,funciones: [Funcion]) {
        
        self.Id = id
        self.Category_name = category
        self.Title = title
        self.Funciones = funciones
        self.Category_id = catId
        
    }
    
    //MARK: - Get Methods
    
    public func getId()->String{
        return self.Id
    }
    
    public func getCategory()->String{
        return self.Category_name
    }
    
    public func getTitle()->String{
        return self.Title
    }
    
    public func getFunciones()->[Funcion]{
        return self.Funciones
    }
    
    public func getCatId()->String{
        return self.Category_id
    }
    
    
}
