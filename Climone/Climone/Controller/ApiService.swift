//
//  ApiService.swift
//  Climone
//
//  Created by Giordano Mattiello on 26/05/21.
//

import Foundation

struct ApiService{
    let key = "ef693a2f25ecbaf97d6229b2efe0424f"
    let lat = "-22.9064"
    let lon = "-47.0616"
    let exclude = "alerts"
    let baseUrl:String
    
    func getForecast(completion: @escaping (Forecast)-> ()) {
        guard let url = URL(string: baseUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { data, resp, error in
            do{
                let forecast = try JSONDecoder().decode(Forecast.self, from: data!)
                print("Call to API sucess")
                DispatchQueue.main.async{
                    completion(forecast)
                }
                
            }catch let error{
                print("Error->",error)
                print("Call to API fail")
            }


        }
        .resume()
    }
    
    init(){
        baseUrl = "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&exclude=\(exclude)&lang=pt_br&appid=\(key)"
    }


    
    
    
    
}
