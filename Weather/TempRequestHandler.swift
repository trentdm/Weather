//
//  TempRequestHandler.swift
//  Weather
//
//  Created by Trent Miller on 5/12/15.
//  Copyright (c) 2015 Trent Miller. All rights reserved.
//

import UIKit

class TempRequestHandler: NSObject {
    
    let apiKey = "a48ecbad42189893";
    
    func getLocaleTemp(locale:String!, completion:(temp:Int) -> ()) {
        let url = NSURL(string: "http://api.wunderground.com/api/\(apiKey)/conditions/q/\(locale).json")
        let request = NSURLRequest(URL: url!)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {(response, data, error) in
            println(NSString(data: data, encoding: NSUTF8StringEncoding))
            if error == nil {
                dispatch_async(dispatch_get_main_queue(), {
                    let wuResponse = WuResponse(data: data);
                    completion(temp:wuResponse.temp);
                })
            }
            else {
                println("Error: \(error.localizedDescription)")            }
        }
    }
    
}
