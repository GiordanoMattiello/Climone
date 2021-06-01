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

    
    var body: some View{
        
        VStack(alignment: .center){
                    
                    
                    VStack{
                        Spacer()
                            .frame(height: (offset.y>100) ? 0 : 100-max(offset.y,0) )
                        Text("Campinas")
                            .fontWeight(.regular)
                            .font(.system(size: 34))
                        Text("Nublado")
                        VStack {
                            Text("22˚")
                                .fontWeight(.thin)
                                .font(.system(size: 120))
                            HStack{
                                Text("Máx.: 30˚")
                                Text("Mín.: 11˚")
                            }
                        }.opacity(( offset.y > 100) ? 0 : 1-Double(offset.y/100) )
                        .frame(width: 200, height: (offset.y<100) ? 200 : 300-max(offset.y,0) )
                        
                    }
                    
                    
                    CustomScrollView(offset: $horizontalOffset, showIndicators: true, axis: .horizontal, content:{
                        HStack{
                            
                                HStack {
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
//                            ForEach(1...30,id: \.self){_ in
//                                
//
//                                HStack {
//                                    Circle()
//                                        .fill(Color.gray.opacity(0.6))
//                                        .frame(width: 70, height: 70)
//                                    VStack(alignment: .leading, spacing: 15, content: {
//                                        Rectangle()
//                                            .fill(Color.gray.opacity(0.6))
//                                            .frame(height:15)
//                                        Rectangle()
//                                            .fill(Color.gray.opacity(0.6))
//                                            .frame(height:15)
//                                            .padding(.trailing,90)
//                                    })
//                                }.padding(.horizontal)
//
//                            }
                        }.padding(.top,10)
                    })
                    .padding()
                    

                    

            }
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .top)

    }

}
