//
//  Wheater.swift
//  Climone
//
//  Created by Matheus Vicente on 02/06/21.
//

import Foundation

struct Weather: Codable {
    let id: Int
    let description: String
    let icon: String
    var weatherIconURL: URL {
        let urlString = "http://openweathermap.org/img/wn/\(icon)@2x.png"
        return URL(string: urlString)!
    }
}
