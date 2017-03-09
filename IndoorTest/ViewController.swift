
//  ViewController.swift
//  IndoorTest
//
//  Created by Dominic Macanas on 2/7/17.
//  Copyright © 2017 MeetBall. All rights reserved.
//

import UIKit
import Mapbox
import MapKit

// Class for map overlay object

class ViewController: UIViewController , MGLMapViewDelegate {
    @IBOutlet weak var mapView: MGLMapView!

    @IBOutlet weak var floorSelector: UISegmentedControl!
    

    var fpImage : UIImage?
    var mapOverlay : MGLOverlay?
    var floor1: MGLStyleLayer?
    var floor1Base: MGLStyleLayer?
    var floor2: MGLStyleLayer?
    var floor2Base: MGLStyleLayer?
    var floor3: MGLStyleLayer?
    var floor3Base: MGLStyleLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.setUserTrackingMode(MGLUserTrackingMode.none, animated: true)
        self.mapView.maximumZoomLevel = 22.0
        self.mapView.delegate = self
            // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    @IBAction func mapviewReset(_ sender: Any) {
        let style = self.mapView.styleURL
        self.mapView.removeFromSuperview()
        self.mapView = nil
        let mapView = MGLMapView(frame: self.view.bounds, styleURL: style)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.setUserTrackingMode(MGLUserTrackingMode.none, animated: true)
        mapView.maximumZoomLevel = 22.0
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.setCenter(CLLocationCoordinate2D.init(latitude: 36.158, longitude: -86.776), zoomLevel: 19, animated: true)
        self.mapView = mapView
        view.addSubview(self.mapView)
        self.view.sendSubview(toBack: self.mapView)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //86.776,36.158
        self.mapView.setCenter(CLLocationCoordinate2D.init(latitude: 36.158, longitude: -86.776), zoomLevel: 19, animated: true)
        self.view.setNeedsDisplay()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func setLocationView(_ sender: Any) {
        self.mapView.setCenter(CLLocationCoordinate2D.init(latitude: 36.158, longitude: -86.776), zoomLevel: 19, animated: true)
    }
    
    @IBAction func changeFloor(_ sender: Any) {
        glInsertEventMarkerEXT(0, "com.apple.GPUTools.event.debug-frame")
        let segment = sender as! UISegmentedControl
        if segment.selectedSegmentIndex == 0 {
            self.showFloor1()
        } else if self.floorSelector.selectedSegmentIndex == 1 {
            self.showFloor2()
        } else {
            self.showFloor3()
        }
    }

    func showFloor1() {
        self.floor1Visibility(visible: true)
        self.floor2Visibility(visible: false)
        self.floor3Visibility(visible: false)
    }
    
    func showFloor2() {
        self.floor1Visibility(visible: false)
        self.floor2Visibility(visible: true)
        self.floor3Visibility(visible: false)
    }
    
    func showFloor3() {
        self.floor1Visibility(visible: false)
        self.floor2Visibility(visible: false)
        self.floor3Visibility(visible: true)
    }
    
    func floor1Visibility(visible: Bool) {
        self.floor1?.isVisible = visible
        self.floor1Base?.isVisible = visible
    }
    
    func floor2Visibility(visible: Bool) {
        self.floor2?.isVisible = visible
        self.floor2Base?.isVisible = visible
    }
    
    func floor3Visibility(visible: Bool) {
        self.floor3?.isVisible = visible
        self.floor3Base?.isVisible = visible
    }
    
    func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {
        self.addLayer(to: style)
    }
    
    func addLayer(to style: MGLStyle) {
        
        let layer1Outline = style.layer(withIdentifier: "cmhf-fl1-43rg2p")
        let layer1Base = style.layer(withIdentifier: "cmhf-fl1-base-74o3k4")
        
        let navy = UIColor.init(colorLiteralRed: 239/255.0, green: 58/255.0, blue: 76/255.0, alpha: 1.0)
        let souce2Base = MGLVectorSource(identifier: "CMHF_FL2_BASE-dx6y1k", configurationURL: NSURL(string: "mapbox://meetball.chcfpall")! as URL)
        let layer2Base = MGLFillStyleLayer(identifier: "CMHF_FL2_BASE-dx6y1k", source: souce2Base)
        layer2Base.sourceLayerIdentifier = "CMHF_FL2_BASE-dx6y1k"
        layer2Base.fillColor = MGLStyleValue(rawValue: navy)
        style.addSource(souce2Base)
        style.addLayer(layer2Base)
        
        let souce2Outline = MGLVectorSource(identifier: "CMHF_FL2-7zp0bp", configurationURL: NSURL(string: "mapbox://meetball.1uk23d25")! as URL)
        let layer2Outline = MGLFillStyleLayer(identifier: "CMHF_FL2-7zp0bp", source: souce2Outline)
        layer2Outline.sourceLayerIdentifier = "CMHF_FL2-7zp0bp"
        layer2Outline.fillColor = MGLStyleValue(rawValue: UIColor.white)
        style.addSource(souce2Outline)
        style.addLayer(layer2Outline)
        
        let source3Base = MGLVectorSource(identifier: "CMHF_FL3_BASE-5pky7l", configurationURL: NSURL(string: "mapbox://meetball.8h4ede5i")! as URL)
        let layer3Base = MGLFillStyleLayer(identifier: "CMHF_FL3_BASE-5pky7l", source: source3Base)
        layer3Base.sourceLayerIdentifier = "CMHF_FL3_BASE-5pky7l"
        layer3Base.fillColor = MGLStyleValue(rawValue: navy)
        
        style.addSource(source3Base)
        style.addLayer(layer3Base)
        
        let source3Outline = MGLVectorSource(identifier: "CMHF_FL3-bzt047", configurationURL: NSURL(string: "mapbox://meetball.2osed8yq")! as URL)
        let layer3Outline = MGLFillStyleLayer(identifier: "CMHF_FL3-bzt047", source: source3Outline)
        layer3Outline.sourceLayerIdentifier = "CMHF_FL3-bzt047"
        layer3Outline.fillColor = MGLStyleValue(rawValue: UIColor.white)
        style.addSource(source3Outline)
        style.addLayer(layer3Outline)
        

        self.floor1 = layer1Outline
        self.floor1Base = layer1Base
        self.floor2 = layer2Outline
        self.floor2Base = layer2Base
        self.floor3 = layer3Outline
        self.floor3Base = layer3Base
        
        if self.floorSelector.selectedSegmentIndex == 0 {
            self.showFloor1()
        } else if self.floorSelector.selectedSegmentIndex == 1 {
            self.showFloor2()
        } else {
            self.showFloor3()
        }
    }

}

