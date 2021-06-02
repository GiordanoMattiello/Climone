//
//  WeatherView.swift
//  Climone
//
//  Created by Giordano Mattiello on 01/06/21.
//
import SwiftUI



struct WeatherView: View {
    // Offset Value...
    @State var offset: CGPoint = .zero
    @State var horizontalOffset: CGPoint = .zero
    @State var titleHeight: CGFloat = 300
    @State var forecast: Forecast? = nil
    
    func hourFormatter (_ dt: Int) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "HH"
        return formatter.string(from: Date(timeIntervalSinceReferenceDate: TimeInterval(dt)))
        
    }
    
    
    var body: some View{
        
        
        VStack(alignment: .center){
            
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
                    .frame(width: 200, height: (offset.y<100) ? 200 : 300-max(offset.y,0) )
                }
                CustomScrollView(offset: $horizontalOffset, showIndicators: false, axis: .horizontal, content:{
                    HStack{
                        
                        HStack(alignment: .center, spacing: 25) {
                            VStack{
                                
                                Text("Agora")
                                
                                Image(reqForecast.hourly[0].weather[0].icon)
                                
                                Text(String(format: "%0.f", reqForecast.hourly[0].temp.rounded() - 273.0))
                                
                            }.padding()
                            
                            ForEach(1..<reqForecast.hourly.count){ i in
                                
                                VStack{
                                    
                                    Text(hourFormatter(reqForecast.hourly[i].dt))
                                    
                                    Image(reqForecast.hourly[i].weather[0].icon)
                                    
                                    Text(String(format: "%0.f", reqForecast.hourly[i].temp.rounded() - 273.0))
                                    
                                }.padding(.horizontal,5)
                                
                            }
                            
                            
                        }
                        
                    }
                })
                .frame(width:400,height:100)
                CustomScrollView(offset: $offset, showIndicators: true, axis: .vertical, content: {
                    
                    
                    VStack(spacing: 15){
                        Rectangle()
                            .fill(Color.gray.opacity(0.6))
                            .frame(height:1)
                        
                        ForEach(1..<reqForecast.daily.count){ i in
                            
                            HStack{
                                
                                Text(String(reqForecast.daily[i].dt))
                                
                                Spacer()
                                
                                Image(reqForecast.daily[i].weather[0].icon)
                                
                                Spacer()
                                
                                Text(String(format: "%0.f",reqForecast.daily[i].temp.max.rounded()  - 273))
                                Text(String(format: "%0.f",reqForecast.daily[i].temp.min.rounded() - 273))
                                
                            }.padding(.horizontal,5)
                        }
                        
                        Rectangle()
                            .fill(Color.gray.opacity(0.6))
                            .frame(height:1)
                        Text("Hoje:Ensolarado no momento. A máxima será de 24˚.Céu Limpo esta noite, com mínima de 13˚ ")
                        Rectangle()
                            .fill(Color.gray.opacity(0.6))
                            .frame(height:1)
                        VStack {
                            
                            HStack {
                                
                                VStack {
                                    Text("NASCER DO SOL")
                                    Text(String(reqForecast.current.sunrise))
                                    
                                }
                                Spacer()
                                
                                VStack{
                                    Text("PÔR DO SOL")
                                    Text(String(reqForecast.current.sunset))
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
                        
                    }.padding(.top,10)
                })
                .padding()
                
            }
            else {
                Text("carregando")
            }
        }.onAppear{
            ApiService().getForecast(completion: { (forecast) in
                self.forecast = forecast
            })
        }.background(Image("bg"))
        
    }
    
}
