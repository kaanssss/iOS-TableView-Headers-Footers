//
//  ViewController.swift
//  TableViewSectionsHeadersFooters
//
//  Created by Kaan Yalçınkaya on 4.12.2021.
//

import UIKit

class PersonName{
    var yName : String?
    var bName : [String]?
    
    init(yName: String, bName:[String]){
        self.yName = yName
        self.bName = bName
    }
}


class ViewController: UIViewController, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var personName = [PersonName]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personName.append(PersonName.init(yName: "A", bName: ["Ali", "Ahmet", "Aylin","Aycan","Anıl","Ateş"]))
        personName.append(PersonName.init(yName: "B", bName: ["Birol", "Beyza", "Berke","Bahadır","Bekir","Beril"]))
        personName.append(PersonName.init(yName: "C", bName: ["Canan", "Caner", "Ceylin","Cenk","Coşkun","Cemil"]))
        personName.append(PersonName.init(yName: "D", bName: ["Deniz", "Derya", "Demet","Derman","Doğukan","Derviş"]))
        personName.append(PersonName.init(yName: "E", bName: ["Emrah", "Ece", "Erkin","Erman","Erol","Enes"]))
        personName.append(PersonName.init(yName: "F", bName: ["Fatma", "Faruk", "Fehmi","Ferhat","Faik","Fahri"]))
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        
        headerView.backgroundColor = UIColor.darkGray
        footerView.backgroundColor = .darkGray
        
        tableView.tableHeaderView = headerView
        tableView.tableFooterView = footerView
        
    
    }


}

extension ViewController:UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return personName.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        20.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return personName[section].yName
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personName[section].bName?.count ?? 0
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = personName[indexPath.section].bName?[indexPath.row]
        cell.backgroundColor = .white
        
        return cell
    }
    
    
}
                                                                                                            //KY

