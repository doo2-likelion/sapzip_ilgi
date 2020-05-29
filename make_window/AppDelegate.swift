//
//  AppDelegate.swift
//  make_window
//
//  Created by Duhee Lee on 2020/05/29.
//  Copyright © 2020 Duhee Lee. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {

    var newWindow: NSWindow!
    var viewController: ViewController!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        newWindow = NSWindow(contentRect: NSMakeRect(10, 10, 300, 300),
                             styleMask: [.closable, .titled],
                             backing: .buffered, defer: false)

        viewController = ViewController()
        viewController!.view = NSView(frame: NSMakeRect(0, 0, newWindow!.frame.size.width, newWindow!.frame.size.height))
        viewController!.view.wantsLayer = true
        newWindow!.contentView!.addSubview(viewController!.view)
        newWindow!.makeKeyAndOrderFront(nil)
        
        let view = DrawView()
        view.translatesAutoresizingMaskIntoConstraints = false
        newWindow!.contentView?.addSubview(view)
        newWindow!.contentView?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|", options: [], metrics: nil, views: ["view": view]))
        newWindow!.contentView?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", options: [], metrics: nil, views: ["view": view]))
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}

