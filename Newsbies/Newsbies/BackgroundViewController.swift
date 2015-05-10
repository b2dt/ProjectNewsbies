//
//  BackgroundViewController.swift
//  Newsbies
//
//  Created by Brent Thoenen on 5/10/15.
//  Copyright (c) 2015 Brent Thoenen. All rights reserved.
//

import UIKit

protocol ChildBackgroundViewControllerDelegate
{
    func childViewControllerDidPressButton(childViewController:BackgroundViewController)
}

class BackgroundViewController: UIViewController {

    var delegate:ChildBackgroundViewControllerDelegate?
    @IBOutlet weak var backgroundButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        var delegate:ChildBackgroundViewControllerDelegate?
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonWasPressed(sender: AnyObject) {
        self.delegate?.childViewControllerDidPressButton(self)
    }
}
