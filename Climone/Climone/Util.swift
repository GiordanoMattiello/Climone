//
//  Util.swift
//  Climone
//
//  Created by Giordano Mattiello on 02/06/21.
//

import Foundation


func hourFormatter (_ dt: Int) -> String{
    let formatter = DateFormatter()
    formatter.dateFormat = "HH"
    return formatter.string(from: Date(timeIntervalSinceReferenceDate: TimeInterval(dt)))
}
func hourMinuteFormatter(_ dt: Int) -> String{
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"
    return formatter.string(from: Date(timeIntervalSinceReferenceDate: TimeInterval(dt)))
}
func weekFormatter(_ dt: Int) -> String{
    let formatter = DateFormatter()
    formatter.locale = Foundation.Locale(identifier: "pt_BR")
    formatter.dateFormat = "EEEE"
    var ret = formatter.string(from: Date(timeIntervalSinceReferenceDate: TimeInterval(dt)))
    ret = ret.capitalized
    return ret
}

