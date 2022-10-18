//
//  Daily.swift
//  Climone
//
//  Created by Matheus Vicente on 02/06/21.
//

import Foundation

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
    let rain: Double?
}
