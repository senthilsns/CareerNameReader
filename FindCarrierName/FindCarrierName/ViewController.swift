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
        FindCarrierDetect()
        
        CTTelephonyNetworkInfo().mo
        
        
    }
    
    
    func FindCarrierDetect()
    {
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
    
    
    func FindIntertConnectivityInSIM() -> Bool
    {
        let telephonyManager = CTTelephonyNetworkInfo();
               if #available(iOS 12.0, *) {
                   let service = telephonyManager.serviceCurrentRadioAccessTechnology
                   if (service != nil) && service?.count ?? 0 > 0 {
                       return true
                   }
               } else {
                   let service = telephonyManager.currentRadioAccessTechnology
                   if (service != nil) && service?.count ?? 0 > 0 {
                       return true
                   }
               };
        
        return false
    }


}

