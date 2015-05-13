//
//  ThemeViewController.swift
//  Newsbies
//
//  Created by Brent Thoenen on 5/10/15.
//  Copyright (c) 2015 Brent Thoenen. All rights reserved.
//

import UIKit

class ThemeViewController: UIViewController {

    @IBOutlet var tView: UIView!
    @IBOutlet weak var ThemeBackground: UIButton!
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tView.backgroundColor=appDelegate.getCurrentTheme().backgroundColor


    }
}
