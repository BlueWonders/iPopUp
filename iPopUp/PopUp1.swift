//
//  PopUp.swift
//  VisualEffect
//
//  Created by apple on 5.10.2016.
//  Copyright © 2016 BlueWonders. All rights reserved.
//

import UIKit

class PopUp1: UIView, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView?
    
    var movies:Array<String>? = ["Star Wars", "LOTR", "Pirates of the Caribbean"]
    var tapCount = 0
 
    struct Objects {
        var sectionName : String!
        var sectionObjects : [String]!
        var sectionSubtitle : [String]!
   
    }
    
    var objectsArray = [Objects]()
    
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return objectsArray[section].sectionName
    }
  
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath) as UITableViewCell
        
        if let movieTitle = movies?[indexPath.row]
        {
            cell.textLabel!.text = movieTitle
        }
        else
        {
            cell.textLabel!.text = ""
        }
        
        print("row: \(indexPath.row), title: \(cell.textLabel!.text!)")
        return cell
    }
 

    override func awakeFromNib() { //same as didload for UIView
    
        tableView?.delegate = self
        tableView?.dataSource = self
        
        tableView?.reloadData()
        tableView?.tableFooterView = UIView()
    }
    
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */

}
