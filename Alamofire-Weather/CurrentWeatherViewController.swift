//
//  CurrentWeatherViewController.swift
//  Alamofire-Weather
//
//  Created by Craig Scott on 9/19/18.
//  Copyright © 2018 Duc Tran. All rights reserved.
//

import UIKit

class CurrentWeatherViewController: UIViewController {
    
    @IBOutlet weak var cityTextLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var scaleLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    let forecastAPIKey : String = "2db373ff3df7483fbebead8b5878da6f"
    let coordinate : (latitude : Double, long : Double) = (37.8267,-122.4233)
    var forecastService : ForecastService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        forecastService = ForecastService(APIKey: forecastAPIKey)
        forecastService.getCurrentWeather(latitude: coordinate.latitude, logitude: coordinate.long){ (currentWeather) in
            DispatchQueue.main.async {
                if let currentWeather = currentWeather{
                    if let temperature = currentWeather.temperature{
                        self.temperatureLabel.text = "\(temperature)°"
                    }else{
                        self.temperatureLabel.text = "-"
                    }
                }
            }
        }
        

        // Do any additional setup after loading the view.
    }
    

    

}
