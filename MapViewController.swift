//
//  MapViewController.swift
//  World Trotter App
//
//  Created by Nathaniel Whittington on 7/18/21.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    var mapView : MKMapView!
    //loads view programm
    override func loadView() {
       
        //create a map view from a property
        mapView = MKMapView()
        
        //set it as the view of the view controller
        view = mapView
        
        //added segment control.
        let segmentControl = UISegmentedControl(items: ["Standard","Hybrid","Satellite"])
        segmentControl.backgroundColor = UIColor.systemBackground
        segmentControl.selectedSegmentIndex = 0
       
        //added a target acion pair to the segment control and associate it with .valuedchanged event.
        segmentControl.addTarget(self, action: #selector(MapViewController.mapTypeChanged(_:)), for: .valueChanged)
        
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentControl)
    
        //used safe area layout guide of map view.
        let topConstraint = segmentControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
       
        //used margins to inset segemnt control using a constant on the constraint.
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
       
        //activated the programmatic layout constrainst
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
        
    }
    //this @objc annotation needed to expose this method to the Objective - runtime. some frameworks still wrttien in Obj c, without this annotation, the segment control cannot seethis action method.
    @objc func mapTypeChanged(_ segControl: UISegmentedControl){
        switch segControl.selectedSegmentIndex{
        
        case 0: mapView.mapType = .standard
        case 1: mapView.mapType = .hybrid
        case 2: mapView.mapType = .satellite
        default: break
        }
    }
}
