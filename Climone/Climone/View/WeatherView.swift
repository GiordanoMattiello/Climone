//
//  WeatherView.swift
//  Climone
//
//  Created by Giordano Mattiello on 01/06/21.
//
import SwiftUI

struct SubtitleSpecifiqueInformation: ViewModifier {
    func body(content: Content) -> some View {
        content
            .opacity(0.5)
            .font(.system(size: 10))

    }
}

struct WeatherView: View {
    // Offset Value...
    @State var offset: CGPoint = .zero
    @State var horizontalOffset: CGPoint = .zero
    @State var titleHeight: CGFloat = 300
    @State var forecast: Forecast? = nil
    
    var body: some View{
        
        
        VStack(alignment: .center, spacing: 0){
            
            if let reqForecast = forecast {
                
                
                VStack{
                    Spacer()
                        .frame(height: (offset.y>100) ? 0 : 100-max(offset.y,0) )
                    Text("Campinas")
                        .fontWeight(.regular)
                        .font(.system(size: 34))
                    
                    Text(reqForecast.current.weather[0].description)
                    VStack {
                        Text(String(format: "%0.f",reqForecast.current.temp - 273) + "˚")
                            .fontWeight(.thin)
                            .font(.system(size: 120))
                        HStack{
                            Text("Máx.: " + String(format: "%0.f",reqForecast.daily[0].temp.max.rounded()  - 273) + "˚")
                            Text("Mín.: " + String(format: "%0.f",reqForecast.daily[0].temp.min.rounded() - 273) + "˚")
                        }
                    }.opacity(( offset.y > 100) ? 0 : 1-Double(offset.y/100) )
                    .frame(width: 200, height: (offset.y<100) ? 200 : (300-max(offset.y,0)) )
                        
                    
                }
                
                Rectangle()
                    .fill(Color.gray.opacity(0.6))
                    .frame(height:1)
                    
                
                
                CustomScrollView(offset: $horizontalOffset, showIndicators: false, axis: .horizontal, content:{
                  
                        
                        HStack(alignment: .center, spacing: 5) {
                            VStack(alignment: .center){
                                
                                Text("Agora")
                                    .fontWeight(.bold)
                                                                    
                                Image(reqForecast.hourly[0].weather[0].icon)
                                    .resizable()
                                    .frame(width: 35.0, height: 35.0, alignment: .center)
                                
                                Text(String(format: "%0.f˚", reqForecast.hourly[0].temp.rounded() - 273.0))
                                    .fontWeight(.bold)
                                    .font(.system(size: 20))
                                
                            }.padding(.horizontal,5)
                            
                            
                           
                            

                            
                            
                            ForEach(1..<reqForecast.hourly.count){ i in
                                
                                VStack(alignment: .center){
                                    
                                    Text(hourFormatter(reqForecast.hourly[i].dt))
                                    
                                    Image(reqForecast.hourly[i].weather[0].icon)
                                        .resizable()
                                        .frame(width: 35.0, height: 35.0, alignment: .center)
                                    
                                    Text(String(format: "%0.f˚", reqForecast.hourly[i].temp.rounded() - 273.0))
                                        .font(.system(size: 20))
                                    
                                }.padding(.horizontal,5)
                                
                            }
                            
                            
                        }.padding(.horizontal, 10)
                        
                    
                })
                .frame(width:400,height:150)
               
                
                Rectangle()
                    .fill(Color.gray.opacity(0.6))
                    .frame(width: 400,height:1)
                   
                
                CustomScrollView(offset: $offset, showIndicators: true, axis: .vertical, content: {
                    
                    VStack(spacing: 0){
                        
                        VStack {
                            ForEach(1..<reqForecast.daily.count){ i in
                                
                                HStack{
                                    
                                    Text(weekFormatter(reqForecast.daily[i].dt))
                                        .font(.body)
                                        .frame(width: 130.0, alignment: .leading)
                                        .font(.system(size: 20))
                                        
                                    
                                    Spacer()
                                    
                                    Image(reqForecast.daily[i].weather[0].icon)
                                        .resizable()
                                        .frame(width: 35.0, height: 35.0, alignment: .center)
                                        
                                    
                                    Spacer()
                                    
                                    HStack{
                                        Text(String(format: "%0.f",reqForecast.daily[i].temp.max.rounded()  - 273))
                                            .padding(.trailing, 5.0)
                                        
                                        Text(String(format: "%0.f",reqForecast.daily[i].temp.min.rounded() - 273))
                                            .opacity(0.5)
                                    }
                                    
                                    .frame(width: 130.0, alignment: .trailing)
                                    
                                    
                                }
                            }
                        }.padding(.horizontal)
                        
                        Rectangle()
                            .fill(Color.gray.opacity(0.6))
                            .frame(height:1)
                        Text("Hoje: \(reqForecast.current.weather[0].description.capitalized). A máxima será de \(String(format: "%0.f",reqForecast.daily[0].temp.max.rounded()  - 273))˚ com mínima de \(String(format: "%0.f",reqForecast.daily[0].temp.min.rounded()  - 273))˚.")
                            .frame(height: 50, alignment: .leading)
                            .padding(3)
                            
                        Rectangle()
                            .fill(Color.gray.opacity(0.6))
                            .frame(height:1)
                        VStack {
                            
                            HStack {
                                
                                VStack {
                                    Text("NASCER DO SOL")
                                        .modifier(SubtitleSpecifiqueInformation())
                                    Text(hourMinuteFormatter(reqForecast.current.sunrise))
                                    
                                }
                                Spacer()
                                
                                VStack{
                                    Text("PÔR DO SOL")
                                    Text(hourMinuteFormatter(reqForecast.current.sunset))
                                }
                                Spacer()
                            }
                            
                            Rectangle()
                                .fill(Color.gray.opacity(0.6))
                                .frame(height:1)
                            
                            HStack {
                                
                                VStack {
                                    Text("CHANCE DE CHUVA")
                                    Text(String(reqForecast.daily[0].pop))
                                    
                                }
                                Spacer()
                                
                                VStack{
                                    Text("UMIDADE")
                                    Text(String(reqForecast.current.humidity))
                                }
                                Spacer()
                            }
                            
                            Rectangle()
                                .fill(Color.gray.opacity(0.6))
                                .frame(height:1)
                            
                            HStack {
                                
                                VStack {
                                    Text("VENTO")
                                    Text("")
                                    
                                }
                                Spacer()
                                
                                VStack{
                                    Text("SENSAÇÃO TÉRMICA")
                                    Text(String(format: "%0.f", reqForecast.current.feels_like.rounded() - 273.0))
                                }
                                Spacer()
                            }
                            
                            Rectangle()
                                .fill(Color.gray.opacity(0.6))
                                .frame(height:1)
                            
                            HStack {
                                
                                VStack {
                                    Text("PRECIPITAÇÃO")
                                    Text(String(reqForecast.daily[0].rain ?? 0))
                                    
                                }
                                Spacer()
                                
                                VStack{
                                    Text("PRESSÃO")
                                    Text(String(reqForecast.current.pressure))
                                }
                                Spacer()
                            }
                            
                            Rectangle()
                                .fill(Color.gray.opacity(0.6))
                                .frame(height:1)
                            
                            HStack {
                                
                                VStack {
                                    Text("VISIBILIDADE")
                                    Text(String(reqForecast.current.visibility))
                                    
                                }
                                Spacer()
                                
                                VStack{
                                    Text("ÍNDICE UV")
                                    Text(String(reqForecast.current.uvi))
                                }
                                Spacer()
                            }
                            
                        }
                        
                        Rectangle()
                            .fill(Color.gray.opacity(0.6))
                            .frame(height:1)
                        
                        Text("Tempo em Campinas. Abrir Mapas")
                        
                    }
                })
                
                
            }
            else {
                Text("carregando")
            }
        }.onAppear{
            ApiService().getForecast(completion: { (forecast) in
                self.forecast = forecast
            })
        }.background(Image("bg"))
        .foregroundColor(Color.white)
        
    }
    
}
