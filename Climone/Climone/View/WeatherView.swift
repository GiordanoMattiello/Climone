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
            .font(.system(size: 14))
            .frame(width:150,alignment: .leading)
            

    }
}
struct specifiqueInformation: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 28))
            .frame(width:150,alignment: .leading)
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
                    
                    Text(reqForecast.current.weather[0].description.capitalized)
                    VStack {
                        
                            Text(String(format: "%0.f",reqForecast.current.temp - 273) + "˚")
                                .fontWeight(.thin)
                                .font(.custom("Helvetica Neue", size: 130))
                                
                        
                        HStack{
                            
                            Text("Máx.: " + String(format: "%0.f",reqForecast.daily[0].temp.max.rounded()  - 273) + "˚")
                            Text("Mín.: " + String(format: "%0.f",reqForecast.daily[0].temp.min.rounded() - 273) + "˚")
                            
                        }
                    }.opacity(( offset.y > 100) ? 0 : 1-Double(offset.y/100) )
                    .frame(width: 200, height: (offset.y<100) ? 200 : (300-max(offset.y,0)) )
                        
                    
                }
                
                Rectangle()
                    .fill(Color.white.opacity(0.6))
                    .frame(height:0.5)
                    
                
                
                CustomScrollView(offset: $horizontalOffset, showIndicators: false, axis: .horizontal, content:{
                  
                        
                        HStack(alignment: .center, spacing: 0) {
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
                .frame(width:400,height:130)
                
               
                
                Rectangle()
                    .fill(Color.white.opacity(0.6))
                    .frame(height:0.5)
                   
                
                CustomScrollView(offset: $offset, showIndicators: true, axis: .vertical, content: {
                    
                    VStack(alignment: .leading,spacing: 0){
                        
                        VStack(spacing: 0) {
                            ForEach(1..<reqForecast.daily.count){ i in
                                
                                HStack{
                                    
                                    Text(weekFormatter(reqForecast.daily[i].dt))
                                        .font(.system(size:20))
                                        .frame(width: 130.0, alignment: .leading)
                                        
                                        
                                    
                                    Spacer()
                                    
                                    Image(reqForecast.daily[i].weather[0].icon)
                                        .resizable()
                                        .frame(width: 35.0, height: 35.0, alignment: .center)
                                        
                                    
                                    Spacer()
                                    
                                    HStack{
                                        Text(String(format: "%0.f",reqForecast.daily[i].temp.max.rounded()  - 273))
                                            .padding(.trailing, 5.0)
                                            .font(.system(size:20))
                                        
                                        Text(String(format: "%0.f",reqForecast.daily[i].temp.min.rounded() - 273))
                                            .opacity(0.5)
                                            .font(.system(size:20))
                                    }
                                    
                                    .frame(width: 130.0, alignment: .trailing)
                                    
                                    
                                }
                            }
                        }.padding(.horizontal)
                        
                        Rectangle()
                            .fill(Color.white.opacity(0.6))
                            .frame(height:0.5)
                        
                        
                        Text("Hoje: \(reqForecast.current.weather[0].description.capitalized). A máxima será de \(String(format: "%0.f",reqForecast.daily[0].temp.max.rounded()  - 273))˚ com mínima de \(String(format: "%0.f",reqForecast.daily[0].temp.min.rounded()  - 273))˚.")
                            .frame(height: 50, alignment: .leading)
                            .padding(10)
                            
                        Rectangle()
                            .fill(Color.white.opacity(0.6))
                            .frame(height:0.5)
                            .padding(.bottom, 5)
                        VStack(spacing: 5) {
                            
                            HStack{
                                VStack {
                                    Text("NASCER DO SOL")
                                        .modifier(SubtitleSpecifiqueInformation())
                                    Text(hourMinuteFormatter(reqForecast.current.sunrise))
                                        .modifier(specifiqueInformation())
                                }
                                
                                Spacer()
                                VStack{
                                    Text("PÔR DO SOL")
                                        .modifier(SubtitleSpecifiqueInformation())
                                    Text(hourMinuteFormatter(reqForecast.current.sunset))
                                        .modifier(specifiqueInformation())
                                        
                                }
                                Spacer()
                                
                            }.padding(.horizontal,10)
                            
            
                            
                            Rectangle()
                                .fill(Color.white.opacity(0.6))
                                .frame(height:0.5)
                                .padding(.horizontal,10)
                            
                            HStack {
                                
                                VStack {
                                    Text("CHANCE DE CHUVA")
                                        .modifier(SubtitleSpecifiqueInformation())
                                    Text(String(format: "%0.f",(reqForecast.daily[0].pop*100.0).rounded()) + "%")
                                        .modifier(specifiqueInformation())
                                    
                                }
                                Spacer()
                                
                                VStack{
                                    Text("UMIDADE")
                                        .modifier(SubtitleSpecifiqueInformation())
                                    Text(String(reqForecast.current.humidity) + "%")
                                        .modifier(specifiqueInformation())
                                }
                                Spacer()
                            }.padding(.horizontal,10)
                            
                            Rectangle()
                                .fill(Color.white.opacity(0.6))
                                .frame(height:0.5)
                                .padding(.horizontal,10)
                            
                            HStack {
                                
                                VStack {
                                    Text("VENTO")
                                        .modifier(SubtitleSpecifiqueInformation())
                                    Text("")
                                        .modifier(specifiqueInformation())
                                    
                                }
                                Spacer()
                                
                                VStack{
                                    Text("SENSAÇÃO TÉRMICA")
                                        .modifier(SubtitleSpecifiqueInformation())
                                    Text(String(format: "%0.f", reqForecast.current.feels_like.rounded() - 273.0) + "˚")
                                        .modifier(specifiqueInformation())
                                }
                                Spacer()
                            }.padding(.horizontal,10)
                            
                            Rectangle()
                                .fill(Color.white.opacity(0.6))
                                .frame(height:0.5)
                                .padding(.horizontal,10)
                            
                            HStack {
                                
                                VStack {
                                    Text("PRECIPITAÇÃO")
                                        .modifier(SubtitleSpecifiqueInformation())
                                    if let prep = reqForecast.daily[0].rain {
                                        Text(String(format: "%0.f cm", (prep / 10.0).rounded()  ) )
                                            .modifier(specifiqueInformation())
                                    }else{
                                        Text("0 cm")
                                            .modifier(specifiqueInformation())
                                    }
                                    
                                    
                                }
                                Spacer()
                                
                                VStack{
                                    Text("PRESSÃO")
                                        .modifier(SubtitleSpecifiqueInformation())
                                    Text(String(reqForecast.current.pressure) + " hPa")
                                        .modifier(specifiqueInformation())
                                }
                                Spacer()
                            }.padding(.horizontal,10)
                            
                            Rectangle()
                                .fill(Color.white.opacity(0.6))
                                .frame(height:0.5)
                                .padding(.horizontal,10)
                            
                            HStack {
                                
                                VStack {
                                    Text("VISIBILIDADE")
                                        .modifier(SubtitleSpecifiqueInformation())
                                    Text(String(reqForecast.current.visibility / 1000 ) )
                                        .modifier(specifiqueInformation())
                                    
                                }
                                Spacer()
                                
                                VStack{
                                    Text("ÍNDICE UV")
                                        .modifier(SubtitleSpecifiqueInformation())
                                    Text(String(reqForecast.current.uvi))
                                        .modifier(specifiqueInformation())
                                }
                                Spacer()
                            }.padding(.horizontal,10)
                            
                        }
                        
                        Rectangle()
                            .fill(Color.white.opacity(0.6))
                            .frame(height:0.5)
                            
                        
                        Text("Tempo em Campinas. Abrir Mapas")
                            .padding(10)
                            
                            
                        
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

