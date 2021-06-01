//
//  Forecast.swift
//  Climone
//
//  Created by Giordano Mattiello on 26/05/21.
//

import Foundation
 
struct Forecast: Codable {
    let lat: Double
    let lon: Double
    
    struct Current: Codable {
        let dt: Int
        let sunrise: Int
        let sunset: Int
        let temp: Double
        let feels_like: Double
        let pressure: Int
        let humidity: Int
        let uvi: Double
        let clouds: Int
        let visibility: Int
        let wind_speed: Double
        let wind_deg: Int
        let weather: [Weather]
    }
    let current: Current
    
    struct Daily: Codable {
       let dt: Int
        let sunrise: Int
        let sunset: Int
        struct Temp: Codable {
            let day: Double
            let min: Double
            let max: Double
        }
        let temp: Temp
        struct Feels_Like: Codable {
            let day: Double
        }
        let feels_like: Feels_Like
        let pressure: Int
        let humidity: Int
        let wind_speed: Double
        let wind_deg: Int
        let weather: [Weather]
        let clouds: Int
        let pop: Double
        let uvi: Double
        
    }
    let daily: [Daily]
    
    struct Hourly: Codable {
        let dt: Int
        let temp: Double
        let weather: [Weather]
        let pop: Double
    }
    
    
}

struct Weather: Codable {
    let id: Int
    let description: String
    let icon: String
    var weatherIconURL: URL {
        let urlString = "http://openweathermap.org/img/wn/\(icon)@2x.png"
        return URL(string: urlString)!
    }
}
