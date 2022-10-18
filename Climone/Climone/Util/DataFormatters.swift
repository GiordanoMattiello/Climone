//
//  File.swift
//  Climone
//
//  Created by Giordano Mattiello on 04/06/21.
//

import Foundation
import MapKit

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
