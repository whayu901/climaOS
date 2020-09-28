//
//  WeathernManager.swift
//  Clima
//
//  Created by GRADANA on 22/09/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=e57f07c23535e60f74668d97dc83d513"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherUrl)&q=\(cityName)"
//        print(urlString)
        performanceRequest(urlString: urlString)
    }
    
    func performanceRequest(urlString: String) {
        
        //        create URL
        if let url = URL(string: urlString) {
            //            create URLSession
            let session = URLSession(configuration: .default)
            
            //            memberikan session untuk menjalankan sesuatu
            let task = session.dataTask(with: url) {
                (data, error, response) in
                if error != nil {
                           print(error!)
                           return
                       }
                       if let safeData = data {
                           let dataString = String(data: safeData, encoding: .utf8)
                           print(dataString)
                       }
            }
            
            //        Start task
            task.resume()
        }
    }
    
//    func handle(data: Data?, response: URLResponse?, error: Error?) {
//        if error != nil {
//            print(error!)
//            return
//        }
//        if let safeData = data {
//            let dataString = String(data: safeData, encoding: .utf8)
//            print(dataString)
//        }
//    }
    
//    func parseJSON(weatherData: Data) {
//        let decoder = JSONDecoder()
//        do {
//            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
//        } catch {
//            <#statements#>
//        }
//    }
}
