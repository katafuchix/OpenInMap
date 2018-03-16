//
//  ViewController.swift
//  OpenInMap
//
//  Created by cano on 2018/03/17.
//  Copyright © 2018年 cano. All rights reserved.
//

import UIKit
import MapKit
import RxCocoa
import RxSwift
import NSObject_Rx

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        button.rx.tap.subscribe(onNext: { _ in
            
            // 浅草寺の位置情報を指定してMKPlacemarkオブジェクトを生成
            let placemark = MKPlacemark(coordinate:
                                            CLLocationCoordinate2D(
                                                    latitude: 35.714697,
                                                    longitude: 139.796777
                                            )
                                )
            
            // MKMapItemオブジェクトを生成
            let mapItem = MKMapItem(placemark: placemark)
            mapItem.name = "浅草寺"
            
            // 移動手段に交通機関を指定
            let launchOptions = [
                MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeTransit,
                MKLaunchOptionsMapTypeKey: MKMapType.standard.rawValue
                ] as [String : Any]
            // 経路情報を伴って地図アプリを起動
            mapItem.openInMaps(launchOptions: launchOptions)
            
        })
        .disposed(by: self.rx.disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

