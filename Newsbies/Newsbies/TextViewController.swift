//
//  TextViewController.swift
//  Newsbies
//
//  Created by Brent Thoenen on 5/10/15.
//  Copyright (c) 2015 Brent Thoenen. All rights reserved.
//

import UIKit
import Foundation

class TextViewController: UIViewController, UIPickerViewDelegate {

    @IBOutlet weak var fontWheel: UIPickerView!
    let fontFamilyNames = UIFont.familyNames()
    var fontz: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myColorWheel = HRColorMapView()
        myColorWheel.hidden = false
        //var i = 0
        self.view.backgroundColor = UIColor.lightGrayColor()
        for familyName in fontFamilyNames {
            // put in fontz
            //i = i + 1
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fontz.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return fontz[row]
    }

    /*func printFonts() {
        let fontFamilyNames = UIFont.familyNames()
        for familyName in fontFamilyNames {
            println("------------------------------")
            println("Font Family Name = [\(familyName)]")
            let names = UIFont.fontNamesForFamilyName(familyName as! String)
            println("Font Names = [\(names)]")
        }
    }*/
}
