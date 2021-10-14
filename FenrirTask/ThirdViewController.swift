//
//  ThirdViewController.swift
//  FenrirTask
//
//  Created by SS S on 2021/10/13.
//  Copyright © 2021年 成田華心. All rights reserved.
//

import UIKit
import Foundation

struct ShopData: Decodable{
    let name: String
    let address: String
    let logo_image: String
}

class ThirdViewController: UIViewController{
    @IBOutlet weak var latitude: UILabel!
    @IBOutlet weak var longitude: UILabel!
    var dataArray = ""
    var range = ""
    var lat = ""
    var lng = ""
    let BASEurl = "http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=ab01fc70cebfd68b&format=json"
    var url = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        print("range : " + range)
        url = BASEurl + "&lat=" + lat + "&lng=" + lng + range
        print("[DBG]url : " + url)

        guard let APIurl = URL(string: url) else {return}
        var request = URLRequest(url: APIurl)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            if let error = error{
                print(error)
                return
            }
            guard let data = data else{
                print("data Empty")
                return
            }
            print(data)
            guard let Arrays = try? JSONDecoder().decode([ShopData].self, from: data) else {
                print("json Error")
                return
            }
            for Array in Arrays {
                print(Array)
            }
  
        })
        task.resume()
    }

}
