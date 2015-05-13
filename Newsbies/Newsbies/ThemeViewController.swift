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
    func selectedCell(childViewController:ThemeViewController, selecedTheme: Theme)
}

class ThemeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    let cellIdentifier = "item"
    var delegate:ChildThemeViewControllerDelegate?
    var themesList = [Theme]()
    @IBOutlet var tView: UIView!
    @IBOutlet weak var CollectionView: UICollectionView!
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tView.backgroundColor=appDelegate.getCurrentTheme().backgroundColor
        let themesH = ThemeHandler()
        themesList = themesH.getThemesFromStorage()
        CollectionView.backgroundColor = appDelegate.getCurrentTheme().backgroundColor
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let themeHandler = ThemeHandler()
        return themeHandler.getThemesFromStorage().count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let item = CollectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as! ThemeCollectionViewCell
        
        item.label.text = "Text"
        
        item.label.font = UIFont(name: themesList[indexPath.row].fontFace, size: CGFloat(themesList[indexPath.row].fontSize))
        item.backgroundView = UIView(frame: item.bounds)
        item.backgroundView?.backgroundColor = themesList[indexPath.row].backgroundColor
        
        item.label.textColor = themesList[indexPath.row].fontColor
        
        return item
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let parent = self.parentViewController as! CustomizeViewController
        parent.sampleText.backgroundColor = themesList[indexPath.row].backgroundColor
        parent.sampleText.font=UIFont(name: themesList[indexPath.row].fontFace, size: CGFloat(themesList[indexPath.row].fontSize))
        parent.sampleText.textColor = themesList[indexPath.row].fontColor
    }
    override func viewWillAppear(animated: Bool) {
        tView.backgroundColor = appDelegate.getCurrentTheme().backgroundColor
    }
}
