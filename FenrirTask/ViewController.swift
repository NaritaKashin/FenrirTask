//
//  ViewController.swift
//  FenrirTask
//
//  Created by SS S on 2021/10/07.
//  Copyright © 2021年 成田華心. All rights reserved.
//

import UIKit
import CoreLocation //位置情報ライブラリ
import MapKit //地図ライブラリ

class ViewController: UIViewController,  CLLocationManagerDelegate {
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var serchButton: UIButton!
    
    var locationManager: CLLocationManager!
    let BASEurl = "http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=ab01fc70cebfd68b"
    var url = ""
    var longitude = ""
    var latitude = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager = CLLocationManager() //変数の初期化
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        locationManager.requestWhenInUseAuthorization() //位置情報の使用の許可を得る
        mapView.showsUserLocation = true
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations:[CLLocation]) {
        longitude = (locations.last?.coordinate.longitude.description)!
        latitude = (locations.last?.coordinate.latitude.description)!
        print("[DBG]longitude : " + longitude)
        print("[DBG]latitude : " + latitude)
        
        mapView.setCenter((locations.last?.coordinate)!, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "to2" {
            let nextView = segue.destination as! SecondViewController
            nextView.lat = self.latitude
            nextView.lng = self.longitude
        }
    }
    
    @IBAction func touchButtonSerch(_ sender: Any){
        print("GOlongitude : " + longitude)
        print("GOlatitude : " + latitude)
    }
}

