//
//  ContentView.swift
//  Climone
//
//  Created by Matheus Vicente on 25/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Text("Campinas")
            Text("Nublado")
            Text("5˚")
            HStack{
                Text("Max: 7˚")
                Text("Min: - 4˚")
            }
            Spacer()
        
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
