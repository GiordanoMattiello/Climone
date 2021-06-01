//
//  ContentView.swift
//  Climone
//
//  Created by Matheus Vicente on 25/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        WeatherView()
    }
}



//struct ContentView: View {
//    @State var forecast:Forecast? = nil
//
//    var body: some View {
//
//        VStack{
//            if let forecast = forecast{
//                Text("Campinas")
//                    .fontWeight(.regular)
//                    .font(.system(size: 34))
//                Text(forecast.current.weather[0].description)
//                Text(String(format: "%0.f",forecast.current.temp - 273) + "˚")
//                    .fontWeight(.thin)
//                    .font(.system(size: 120))
//                HStack{
//                    Text("Máx.: " + String(format: "%0.f",forecast.daily[0].temp.max.rounded()  - 273) + "˚")
//                    Text("Mín.: " + String(format: "%0.f",forecast.daily[0].temp.min.rounded() - 273) + "˚")
//                }
//
//
//                Spacer()
//            }else{
//                Text("Carregando")
//
//            }
//
//
//        }.onAppear{
//            ApiService().getForecast(completion: { (forecast) in
//                self.forecast = forecast
//            })
//        }
//
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
