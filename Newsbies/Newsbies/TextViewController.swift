//
//  TextViewController.swift
//  Newsbies
//
//  Created by Brent Thoenen on 5/10/15.
//  Copyright (c) 2015 Brent Thoenen. All rights reserved.
//

import UIKit
import Foundation

class TextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let myColorWheel = HRColorMapView()
        myColorWheel.hidden = false
        
        self.view.backgroundColor = UIColor.lightGrayColor()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
