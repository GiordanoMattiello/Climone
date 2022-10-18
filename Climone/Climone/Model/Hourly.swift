//
//  Hourly.swift
//  Climone
//
//  Created by Matheus Vicente on 02/06/21.
//

import Foundation

struct Hourly: Codable {
    let dt: Int
    let temp: Double
    let weather: [Weather]
    let pop: Double
}
