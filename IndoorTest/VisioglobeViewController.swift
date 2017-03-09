//
//  VisioglobeViewController.swift
//  IndoorTest
//
//  Created by Dominic Macanas on 3/6/17.
//  Copyright © 2017 MeetBall. All rights reserved.
//

import UIKit

class VisioglobeViewController: UIViewController {

    @IBOutlet weak var mapView: VMEMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.loadMap()
        self.view.contentMode = UIViewContentMode.scaleToFill
        self.title = "Visioglobe"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        glInsertEventMarkerEXT(0, "com.apple.GPUTools.event.debug-frame")
        let context = UIGraphicsGetCurrentContext()
        if context != nil {
            context!.flush()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
