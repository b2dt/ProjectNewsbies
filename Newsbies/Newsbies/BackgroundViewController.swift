//
//  BackgroundViewController.swift
//  Newsbies
//
//  Created by Brent Thoenen on 5/10/15.
//  Copyright (c) 2015 Brent Thoenen. All rights reserved.
//

import UIKit


class BackgroundViewController: UIViewController {

    @IBOutlet var tView: UIView!
    @IBOutlet weak var backgroundButton: UIButton!
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

    override func viewDidLoad()
    {
        super.viewDidLoad()
        tView.backgroundColor=appDelegate.getCurrentTheme().backgroundColor

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        tView.backgroundColor = appDelegate.getCurrentTheme().backgroundColor
    }
}
