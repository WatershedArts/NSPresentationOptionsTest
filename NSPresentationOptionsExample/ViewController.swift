//
//  ViewController.swift
//  NSPresentationOptionsExample
//
//  Created by David Haylock on 03/06/2015.
//  Copyright (c) 2015 David Haylock. All rights reserved.
//

import Cocoa

// Screen Sizes
let FirstScreenSize: NSSize! = NSScreen.mainScreen()?.frame.size
let SecondScreenSize: NSSize! = NSScreen.screens()?.last?.frame.size

class ViewController: NSViewController {
    

    @IBOutlet var imageView: NSImageView!
    @IBOutlet var textLabel: NSTextField!
    @IBOutlet var ScreenLabel: NSTextField!
    //----------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var imageViewConstraints:[AnyObject] = [
            NSLayoutConstraint(item: self.imageView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 1.0, constant: -260),
            NSLayoutConstraint(item: self.imageView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 1.0, constant: -(83*2))]

        var labelConstraints:[AnyObject] = [NSLayoutConstraint(item: self.textLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: self.textLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: -50)]

        var reportLabel:[AnyObject] = [NSLayoutConstraint(item: self.ScreenLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: self.ScreenLabel, attribute: .Top, relatedBy: .Equal, toItem: self.textLabel, attribute: .Bottom, multiplier: 1.0, constant: 0)]
        
        self.view.addConstraints(imageViewConstraints)
        self.view.addConstraints(labelConstraints)
        self.view.addConstraints(reportLabel)
        
        self.ScreenLabel.stringValue = "Screen Size Width: \(FirstScreenSize.width)  Height: \(FirstScreenSize.height)"

    }
    //----------------------------------------------
    override func viewDidAppear() {
        let presOptions: NSApplicationPresentationOptions =
        //----------------------------------------------
        // These are all the options for the NSApplicationPresentationOptions
        // BEWARE!!!
        // Some of the Options may conflict with each other
        //----------------------------------------------

        //  .Default                   |
        //  .AutoHideDock              |   // Dock appears when moused to
        //  .AutoHideMenuBar           |   // Menu Bar appears when moused to
        //  .DisableForceQuit          |   // Cmd+Opt+Esc panel is disabled
        //  .DisableMenuBarTransparency|   // Menu Bar's transparent appearance is disabled
        //  .FullScreen                |   // Application is in fullscreen mode
            .HideDock                  |   // Dock is entirely unavailable. Spotlight menu is disabled.
            .HideMenuBar               |   // Menu Bar is Disabled
            .DisableAppleMenu          |   // All Apple menu items are disabled.
            .DisableProcessSwitching   |   // Cmd+Tab UI is disabled. All Exposé functionality is also disabled.
            .DisableSessionTermination |   // PowerKey panel and Restart/Shut Down/Log Out are disabled.
            .DisableHideApplication    |   // Application "Hide" menu item is disabled.
            .AutoHideToolbar
        
        let optionsDictionary = [NSFullScreenModeApplicationPresentationOptions :
            NSNumber(unsignedLong: presOptions.rawValue)]
        
        self.view.enterFullScreenMode(NSScreen.mainScreen()!, withOptions:optionsDictionary)
        self.view.wantsLayer = true
    }
    //----------------------------------------------
    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

