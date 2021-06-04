//
//  Maps.swift
//  Climone
//
//  Created by Giordano Mattiello on 04/06/21.
//

import Foundation
func hourFormatter (_ dt: Int) -> String{
    let formatter = DateFormatter()
    formatter.dateFormat = "HH"
    return formatter.string(from: Date(timeIntervalSince1970: TimeInterval(dt)))
}

func hourMinuteFormatter(_ dt: Int) -> String{
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"
    return formatter.string(from: Date(timeIntervalSince1970: TimeInterval(dt)))
}

func weekFormatter(_ dt: Int) -> String{
    let formatter = DateFormatter()
    formatter.locale = Foundation.Locale(identifier: "pt_BR")
    formatter.dateFormat = "EEEE"
    var ret = formatter.string(from: Date(timeIntervalSince1970: TimeInterval(dt)))
    ret = ret.capitalized
    return ret
}

func day (_ dt: Int){
    let formatter = DateFormatter()
    formatter.locale = Foundation.Locale(identifier: "pt_BR")
    formatter.dateFormat = "E, d MMM yyyy"
    var ret = formatter.string(from: Date(timeIntervalSince1970: TimeInterval(dt)))
    ret = ret.capitalized
    print(ret)
}
