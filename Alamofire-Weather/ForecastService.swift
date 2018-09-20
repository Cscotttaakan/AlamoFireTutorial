//
//  ForecastService.swift
//  Alamofire-Weather
//
//  Created by Craig Scott on 9/19/18.
//  Copyright © 2018 Duc Tran. All rights reserved.
//

import Foundation

class ForecastService {
    
    let forecastAPIKey : String
    let forecastBaseURL : URL?
    
    
    init(APIKey : String){
        forecastAPIKey = APIKey
        forecastBaseURL = URL(string: "https://api.darksky.net/forecast/\(APIKey)")
    }
    

    func getCurrentWeather(latitude: Double , logitude: Double){
        let forecastURL = URL(string: "\(forecastBaseURL)/\(latitude),\(logitude)")
    }
    
}
