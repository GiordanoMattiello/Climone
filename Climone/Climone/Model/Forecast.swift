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
    
  
    let current: Current
    let hourly: [Hourly]
    
    let daily: [Daily]
    
    
    
}


