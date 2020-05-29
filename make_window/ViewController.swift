//
//  ViewController.swift
//  make_window
//
//  Created by Duhee Lee on 2020/05/29.
//  Copyright © 2020 Duhee Lee. All rights reserved.
//

import Cocoa


class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("loaded")

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    override func mouseDown(with event: NSEvent){
        print("HI")
    }
}

class DrawView: NSView {
    var path: NSBezierPath = NSBezierPath()

    override func mouseDown(with event: NSEvent) {
        path.move(to: convert(event.locationInWindow, from: nil))
        needsDisplay = true
    }

    override func mouseDragged(with event: NSEvent) {
        path.line(to: convert(event.locationInWindow, from: nil))
        needsDisplay = true
    }

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        NSColor.black.set()

        path.lineJoinStyle = .round
        path.lineCapStyle = .round
        path.lineWidth = 10.0
        path.stroke()
    }
}
