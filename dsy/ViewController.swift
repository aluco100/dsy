//
//  ViewController.swift
//  dsy
//
//  Created by Alfredo Luco on 24-02-17.
//  Copyright © 2017 Dsarhoya. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    //MARK: - Global variables
    
    var eventData: [Event] = []
    
    //MARK: - Outlets
    
    @IBOutlet var eventTableView: UITableView!
    @IBOutlet var dateNavBar: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let algo : CalendarManager = CalendarManager(baseURL: "http://www.estoy.cl/")
        
        algo.getEvents(url: "ws/eventos", onSuccess: {
            events in
            
            let manager:AppManager = AppManager()
            self.eventData = manager.getEvents(events: events)
            self.dateNavBar.text = self.eventData.first!.getFunciones().first!.Date
            self.eventTableView.reloadData()
        })
        
        //Tableview properties
        
        self.eventTableView.delegate = self
        self.eventTableView.dataSource = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    //MARK: - TableViews Delegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.eventData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventIdentifier", for: indexPath) as! EventTableViewCell
        
        //category settings
        
        cell.category.text = eventData[indexPath.row].getCategory()
        
        switch eventData[indexPath.row].getCatId() {
        case "1":
            cell.category.textColor = UIColor.blue
            break
        case "2":
            cell.category.textColor = UIColor.green
            break
        case "3":
            cell.category.textColor = UIColor.black
            break
        case "4":
            cell.category.textColor = UIColor.brown
            break
        case "5":
            cell.category.textColor = UIColor.darkGray
            break
        case "6":
            cell.category.textColor = UIColor.magenta
            break
        case "7":
            cell.category.textColor = UIColor.purple
            break
        default:
            break
        }
        
        let fuc = eventData[indexPath.row].getFunciones()
        cell.date.text = fuc.first?.getDate()
        cell.title.text = eventData[indexPath.row].getTitle()
        
        return cell
        
    }


}

