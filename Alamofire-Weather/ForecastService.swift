//
//  ForecastService.swift
//  Alamofire-Weather
//
//  Created by Craig Scott on 9/19/18.
//  Copyright © 2018 Duc Tran. All rights reserved.
//

import Foundation
import Alamofire

class ForecastService {
    
    let forecastAPIKey : String
    let forecastBaseURL : URL?
    
    
    init(APIKey : String){
        forecastAPIKey = APIKey
        forecastBaseURL = URL(string: "https://api.darksky.net/forecast/\(APIKey)")
    }
    

    func getCurrentWeather(latitude: Double , logitude: Double, completion : @escaping (CurrentWeather?) -> Void ){
        if let forecastURL = URL(string: "\(String(describing: forecastBaseURL!))/\(latitude),\(logitude)"){
            
            //Use Alamofire to request access to Weather API which responds with JSON reply
            Alamofire.request(forecastURL).responseJSON(completionHandler: {(response) in
                if let jsonDictionary = response.result.value as? [String : Any] {
                    if let currentWeatherDictionary = jsonDictionary["currently"] as? [String : Any]{
                        
                        let currentWeather = CurrentWeather(weatherDictionary: currentWeatherDictionary)
                        completion(currentWeather)
                    }else{
                        completion(nil)
                    }
                }
            })
            
        }
        
    }
    
}
