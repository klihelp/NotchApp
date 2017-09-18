//
//  ViewController.swift
//  NotchApp
//
//  Created by Ezhik on 9/18/17.
//
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view.
        
        if let window = self.view.window {
            //hide title
            window.titleVisibility = NSWindowTitleVisibility.Hidden;
            window.titlebarAppearsTransparent = true;
            window.styleMask |= NSFullSizeContentViewWindowMask;
            
            //transparent
            window.opaque = false;
            window.backgroundColor = NSColor.clearColor();
            
            //on top https://stackoverflow.com/questions/27396957/keep-window-always-on-top
            window.level = Int(CGWindowLevelForKey(.FloatingWindowLevelKey));
            window.level = Int(CGWindowLevelForKey(.MaximumWindowLevelKey));
            
            window.standardWindowButton(NSWindowButton.CloseButton)!.hidden = true;
            window.standardWindowButton(NSWindowButton.ZoomButton)!.hidden = true;
            window.standardWindowButton(NSWindowButton.MiniaturizeButton)!.hidden = true;
            
            if let screen : NSScreen = NSScreen.mainScreen()! {
                let screenWidth = screen.frame.size.width;
                let screenHeight = screen.frame.size.height;
                
                let width = screenWidth * 0.1;
                let height = width * 0.15;
                let size = CGSize(width: width, height: height)
                
                let x = (screenWidth - width) / 2;
                let y = screenHeight;
                let point = CGPoint(x: x, y: y);
                
                window.setFrame(NSRect(origin: point, size: size), display: true);
                self.view.frame = NSRect(origin: point, size: size);
                notchImage.frame = self.view.frame;
            }
        }
        
    }

    @IBOutlet weak var notchImage: NSImageView!
    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

