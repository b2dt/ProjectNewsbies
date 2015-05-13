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
    func childTextViewControllerDidPressButton(childViewController:TextViewController)
}

class TextViewController: UIViewController {

    @IBOutlet var tView: UIView!
    @IBOutlet weak var TextButton: UIButton!
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    var delegate:ChildTextViewControllerDelegate?

    @IBOutlet weak var FontText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tView.backgroundColor=appDelegate.getCurrentTheme().backgroundColor
        
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonWasPressed(sender: AnyObject) {
        self.delegate?.childTextViewControllerDidPressButton(self)
    }
    
    override func viewWillAppear(animated: Bool) {
        tView.backgroundColor = appDelegate.getCurrentTheme().backgroundColor
    }
}
