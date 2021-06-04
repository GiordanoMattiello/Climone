//
//  Util.swift
//  Climone
//
//  Created by Giordano Mattiello on 02/06/21.
//

import Foundation
import MapKit
import UIKit

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

func openMap() {
    
    let regionDistance:CLLocationDistance = 10000
    let coordinates:CLLocationCoordinate2D
    
    coordinates = CLLocationCoordinate2DMake(-22.811967226059956, -47.06066646666626)
    
    
    let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
    let options = [
        MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
        MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
    ]
    let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
    let mapItem = MKMapItem(placemark: placemark)
    
    mapItem.name = "Unicamp"
    
    mapItem.openInMaps(launchOptions: options)
    

}


func windDirectionFromDegrees(degrees : Double) -> String {
    let directions = ["N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"]
    let i: Int = Int((degrees + 11.25)/22.5)
    return directions[i % 16]
}
