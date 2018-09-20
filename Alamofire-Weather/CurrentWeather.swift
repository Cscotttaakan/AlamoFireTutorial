//
//  CurrentWeather.swift
//  Alamofire-Weather
//
//  Created by Craig Scott on 9/19/18.
//  Copyright © 2018 Duc Tran. All rights reserved.
// JSON : JavaScript Object Notation

import Foundation

struct weatherKeys{
    static let temperature = "temperature"
    static let humidity = "humidity"
    static let precipProbability = "precipProbability"
    static let summary = "summary"
    static var icon = "icon"
}

class CurrentWeather {
    
    let temperature : Double?
    let humidity : Int?
    let precipProbability : Int?
    let summary : String?
    let icon : String?
    
    init(weatherDictionary : [String : Any?]){
        
        temperature = weatherDictionary[weatherKeys.temperature] as? Double
        if let humidityDouble = weatherDictionary[weatherKeys.humidity] as? Double{
            humidity = Int(humidityDouble * 100)
        }else{
            humidity = nil
        }
        
        if let precipDouble = weatherDictionary[weatherKeys.precipProbability] as? Double{
            precipProbability = Int(precipDouble * 100)
        }else{
            precipProbability = nil
        }
        
        summary = weatherDictionary[weatherKeys.summary] as? String
        icon = weatherDictionary[weatherKeys.icon] as? String
        
    }
    
    
    
}
