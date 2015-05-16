//
//  ViewController.swift
//  Weather
//
//  Created by Trent Miller on 5/12/15.
//  Copyright (c) 2015 Trent Miller. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var localeLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    
    var locale: String!
    var temp: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locale = "Cupertino";
        let tempRequestHandler = TempRequestHandler();
        tempRequestHandler.getLocaleTemp(locale) { (temp:Int) in
            self.tempLabel.text = "\(temp)C";
            NSOperationQueue.mainQueue().addOperationWithBlock() { () in
//                self.tempLabel.reloadData()
            }
        }
        localeLabel.text = locale;
        tempLabel.text = "_C";
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

