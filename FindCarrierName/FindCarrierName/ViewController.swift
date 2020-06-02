//
//  ViewController.swift
//  FindCarrierName
//
//  Created by Senthil Kumar2 on 02/06/20.
//  Copyright © 2020 Senthil Kumar2. All rights reserved.
//

import UIKit
import CoreTelephony

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        // Find Network Carrier Name
        if #available(iOS 12.0, *) {
            if let providers = CTTelephonyNetworkInfo().serviceSubscriberCellularProviders {
                providers.forEach { (key, value) in
                    print("key: \(key), carrier: \(value.carrierName ?? "nil")")
                }
            }
        } else {
            let provider = CTTelephonyNetworkInfo().subscriberCellularProvider
            print("carrier: \(provider?.carrierName ?? "nil")")
        }
        
        
    }


}

