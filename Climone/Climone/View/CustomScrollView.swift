//
//  CustomScrollView.swift
//  Climone
//
//  Created by Giordano Mattiello on 01/06/21.
//

import SwiftUI

struct CustomScrollView<Content: View>: View{
    
    var content: Content
    
    @Binding var offset: CGPoint
    var showIndicators: Bool
    var axis: Axis.Set
    
    init(offset: Binding<CGPoint>,showIndicators: Bool,axis: Axis.Set,@ViewBuilder content: ()->Content){
        
        self.content = content()
        self._offset = offset
        self.showIndicators = showIndicators
        self.axis = axis
    }
    
    @State var startOffset: CGPoint = .zero
    @State var movedLastInteraction: Bool = false

    var body: some View{
        
        ScrollView(axis, showsIndicators: showIndicators, content:{
            content
                .overlay(
                    GeometryReader{proxy -> Color in
                        
                        let rect = proxy.frame(in: .global)
                        
                        
                        
                        if startOffset == .zero{
                            DispatchQueue.main.async{
                                startOffset = CGPoint(x: rect.minX,y: rect.minY)
                            }
                        }
                       
                        DispatchQueue.main.async{
                            if(self.movedLastInteraction){
                                self.offset = CGPoint(x: startOffset.x - (rect.minX) ,y: startOffset.y - rect.minY )
                                self.movedLastInteraction=false
                            }else{
                                self.movedLastInteraction = true
                            }

                        }
                        

                        
                        return Color.clear
                    }

                )
        })
  
            
    }

    
}
