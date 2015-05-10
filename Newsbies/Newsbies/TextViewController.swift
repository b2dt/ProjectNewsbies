//
//  TextViewController.swift
//  Newsbies
//
//  Created by Brent Thoenen on 5/10/15.
//  Copyright (c) 2015 Brent Thoenen. All rights reserved.
//

import UIKit

protocol ChildTextViewControllerDelegate
{
    func childViewControllerDidPressButton(childViewController:TextViewController)
}

class TextViewController: UIViewController {

    var delegate:ChildTextViewControllerDelegate?

    @IBOutlet weak var FontText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        var delegate:ChildTextViewControllerDelegate?
        // Do any additional setup after loading the view.
    }
}
