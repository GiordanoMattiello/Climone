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

    
    var body: some View{
        
        VStack(alignment: .center){
                    
            if let forecast = forecast {
                
            VStack{
                Spacer()
                    .frame(height: (offset.y>100) ? 0 : 100-max(offset.y,0) )
                Text("Campinas")
                    .fontWeight(.regular)
                    .font(.system(size: 34))
                Text(forecast.current.weather[0].description)
                VStack {
                    Text(String(format: "%0.f",forecast.current.temp - 273) + "˚")
                        .fontWeight(.thin)
                        .font(.system(size: 120))
                    HStack{
                        Text("Máx.: " + String(format: "%0.f",forecast.daily[0].temp.max.rounded()  - 273) + "˚")
                        Text("Mín.: " + String(format: "%0.f",forecast.daily[0].temp.min.rounded() - 273) + "˚")
                    }
                }.opacity(( offset.y > 100) ? 0 : 1-Double(offset.y/100) )
                    .frame(width: 200, height: (offset.y<100) ? 200 : 300-max(offset.y,0) )
            }
            CustomScrollView(offset: $horizontalOffset, showIndicators: false, axis: .horizontal, content:{
                        HStack{
                            
                            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 25) {
                                    VStack{
                                        Text("Agora")
                                        Text("S")
                                        Text("22")
                                    }.padding(.horizontal,5)
                                    VStack{
                                        Text("10")
                                        Text("S")
                                        Text("22")
                                    }
                                    VStack{
                                        Text("11")
                                        Text("S")
                                        Text("22")
                                    }
                                    VStack{
                                        Text("12")
                                        Text("S")
                                        Text("22")
                                    }
                                    VStack{
                                        Text("13")
                                        Text("S")
                                        Text("22")
                                    }
                                    VStack{
                                        Text("14")
                                        Text("S")
                                        Text("22")
                                    }
                                    VStack{
                                        Text("15")
                                        Text("S")
                                        Text("22")
                                    }
                                    VStack{
                                        Text("16")
                                        Text("S")
                                        Text("22")
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
                        VStack{
                            ForEach(0..<9){ i in
                                HStack{
                                    Text("Quarta")
                                    Spacer()
                                    Text("S")
                                    Spacer()
                                    Text("22")
                                    Text("30")
                                }.padding(.top,5)
                            }
                        }.padding()
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
                                    Text("10:00")
                                    
                                }
                                Spacer()
                                
                                VStack{
                                    Text("PÔR DO SOL")
                                    Text("10:00")
                                }
                                Spacer()
                            }
                            
                            Rectangle()
                                .fill(Color.gray.opacity(0.6))
                                .frame(height:1)
                            
                            HStack {
                                
                                VStack {
                                    Text("NASCER DO SOL")
                                    Text("10:00")
                                    
                                }
                                Spacer()
                                
                                VStack{
                                    Text("PÔR DO SOL")
                                    Text("10:00")
                                }
                                Spacer()
                            }
                            
                            Rectangle()
                                .fill(Color.gray.opacity(0.6))
                                .frame(height:1)
                            
                            HStack {
                                
                                VStack {
                                    Text("NASCER DO SOL")
                                    Text("10:00")
                                    
                                }
                                Spacer()
                                
                                VStack{
                                    Text("PÔR DO SOL")
                                    Text("10:00")
                                }
                                Spacer()
                            }
                            
                            Rectangle()
                                .fill(Color.gray.opacity(0.6))
                                .frame(height:1)
                            
                            HStack {
                                
                                VStack {
                                    Text("NASCER DO SOL")
                                    Text("10:00")
                                    
                                }
                                Spacer()
                                
                                VStack{
                                    Text("PÔR DO SOL")
                                    Text("10:00")
                                }
                                Spacer()
                            }
                            
                            Rectangle()
                                .fill(Color.gray.opacity(0.6))
                                .frame(height:1)
                            
                            HStack {
                                
                                VStack {
                                    Text("NASCER DO SOL")
                                    Text("10:00")
                                    
                                }
                                Spacer()
                                
                                VStack{
                                    Text("PÔR DO SOL")
                                    Text("10:00")
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
        }
        
    }

}
