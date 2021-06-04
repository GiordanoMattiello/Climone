//
//  windFormatters.swift
//  Climone
//
//  Created by Giordano Mattiello on 04/06/21.
//

import Foundation

func windDirectionFromDegrees(degrees : Double) -> String {
    let directions = ["N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"]
    let i: Int = Int((degrees + 11.25)/22.5)
    return directions[i % 16]
}
