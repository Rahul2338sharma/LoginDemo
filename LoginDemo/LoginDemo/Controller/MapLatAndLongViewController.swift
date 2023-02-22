//
//  MapLatAndLongViewController.swift
//  LoginDemo
//
//  Created by Rahul Sharama on 21/02/23.
//

import UIKit
import MapKit
import CoreLocation

class MapLatAndLongViewController: UIViewController , CLLocationManagerDelegate,MKMapViewDelegate{
    @IBOutlet weak var mapView : MKMapView!
  let locationManager = CLLocationManager()
    var lattitude : Double!
    var longitude : Double!
    var userName : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.requestAlwaysAuthorization()

            // For use in foreground
            self.locationManager.requestWhenInUseAuthorization()

            if CLLocationManager.locationServicesEnabled() {
                locationManager.delegate = self
                locationManager.desiredAccuracy = kCLLocationAccuracyBest
                locationManager.startUpdatingLocation()
            }

            mapView.delegate = self
            mapView.mapType = .standard
            mapView.isZoomEnabled = true
            mapView.isScrollEnabled = true

            if let coor = mapView.userLocation.location?.coordinate{
                mapView.setCenter(coor, animated: true)
            }
    }
    
    // This method will call when user want to go back to the previous screen.
    @IBAction func backButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    // delegate method.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        var locValue = CLLocationCoordinate2D()
        locValue.latitude = lattitude
        locValue.longitude = longitude

        mapView.mapType = MKMapType.standard

        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: locValue, span: span)
        mapView.setRegion(region, animated: true)

        let annotation = MKPointAnnotation()
        annotation.coordinate = locValue
        annotation.title = userName
        annotation.subtitle = "lattitude \(lattitude!)  Longitude \(longitude!)"
        mapView.addAnnotation(annotation)

        //centerMap(locValue)
    }
    
}
