//
//  WuResponse.swift
//  Weather
//
//  Created by Trent Miller on 5/16/15.
//  Copyright (c) 2015 Trent Miller. All rights reserved.
//

import UIKit

class WuResponse: NSObject {
    var temp: Int = 0;
    
    init(data: NSData) {
        super.init();
        
        var error : NSError?
        var response: AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(), error: &error);
        
        if let dict = response as? NSDictionary {
            if let obs = dict["current_observation"] as? NSDictionary {
                self.temp = obs["temp_c"] as! Int;
            }
        }
    }
}
