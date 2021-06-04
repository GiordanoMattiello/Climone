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
    
    var body: some View{
        
        ScrollView(axis, showsIndicators: showIndicators, content:{
            content
                .background(GeometryReader {
                            Color.clear.preference(key: ViewOffsetKey.self,
                                value: -$0.frame(in: .named("scroll")).origin.y)
                }).onPreferenceChange(ViewOffsetKey.self) { print("offset >> \($0)")
                    offset.y = $0
                }
            }).coordinateSpace(name: "scroll")
    }

    
}

struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}


