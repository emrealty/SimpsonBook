//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Emre Altay on 26.02.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var mySimpsons = [Simpson]()
    var chosenSimpson : Simpson?
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self

        //Simpson Object
        
        
        let homer = Simpson(SimpsonName: "Homer Simpson", SimpsonJob: "Nuclear Safety", SimpsonImage: UIImage(named: "homer")!)
        let marge = Simpson(SimpsonName: "Marge Simpson", SimpsonJob: "Housewife", SimpsonImage: UIImage(named: "marge")!)
        let bart = Simpson(SimpsonName: "Bart Simpson", SimpsonJob: "Student", SimpsonImage: UIImage(named: "bart")!)
        let lisa = Simpson(SimpsonName: "Lisa Simpson", SimpsonJob: "Student", SimpsonImage: UIImage(named: "lisa")!)
        let maggie = Simpson(SimpsonName: "Maggie Simpson", SimpsonJob: "Baby", SimpsonImage: UIImage(named: "maggie")!)
        
        mySimpsons.append(homer)
        mySimpsons.append(marge)
        mySimpsons.append(bart)
        mySimpsons.append(lisa)
        mySimpsons.append(maggie)
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpsons.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = mySimpsons[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = mySimpsons[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! detailsVC
            destinationVC.selectedSimpson = chosenSimpson
        }
    }


}

