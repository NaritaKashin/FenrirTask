//
//  SecondViewController.swift
//  FenrirTask
//
//  Created by SS S on 2021/10/13.
//  Copyright © 2021年 成田華心. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var Button300m: UIButton!
    @IBOutlet weak var Button500m: UIButton!
    @IBOutlet weak var Button1000m: UIButton!
    @IBOutlet weak var Button2000m: UIButton!
    @IBOutlet weak var Button3000m: UIButton!

    var lat = "umi"
    var lng = "yama"
    var range = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(lat)
        print(lng)
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let nextView = segue.destination as! ThirdViewController
            nextView.lat = self.lat
            nextView.lng = self.lng
        if segue.identifier == "to300m"{
            let next = segue.destination as! ThirdViewController
            next.range = "&range=1"
        }
        else if segue.identifier == "to500m"{
            let next = segue.destination as! ThirdViewController
            next.range = "&range=2"
        }
        else if segue.identifier == "to1000m"{
            let next = segue.destination as! ThirdViewController
            next.range = "&range=3"
        }
        else if segue.identifier == "to2000m"{
            let next = segue.destination as! ThirdViewController
            next.range = "&range=4"
        }
        else if segue.identifier == "to3000m"{
            let next = segue.destination as! ThirdViewController
            next.range = "&range=5"
        }
        
    }
    
    @IBAction func touchButton300m(_ sender: Any){
        self.performSegue(withIdentifier: "to300m", sender: nil)
    }
    @IBAction func touchButton500m(_ sender: Any){
        self.performSegue(withIdentifier: "to500m", sender: nil)
    }
    @IBAction func touchButton1000m(_ sender: Any){
        self.performSegue(withIdentifier: "to1000m", sender: nil)
    }
    @IBAction func touchButton2000m(_ sender: Any){
        self.performSegue(withIdentifier: "to2000m", sender: nil)
    }
    @IBAction func touchButton3000m(_ sender: Any){
        self.performSegue(withIdentifier: "to3000m", sender: nil)
    }
    
}
