//
//  ThemeViewController.swift
//  Newsbies
//
//  Created by Brent Thoenen on 5/10/15.
//  Copyright (c) 2015 Brent Thoenen. All rights reserved.
//

import UIKit

protocol ChildThemeViewControllerDelegate
{
    func childViewControllerDidPressButton(childViewController:ThemeViewController)
}
class ThemeViewController: UIViewController {

    var delegate:ChildThemeViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var delegate:ChildThemeViewControllerDelegate?

    }
}
