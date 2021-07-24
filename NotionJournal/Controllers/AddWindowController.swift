//
//  AddWindowController.swift
//  NotionJournal
//
//  Created by Alexey Grabik on 19.07.2021.
//

import Cocoa

class AddWindowController: NSWindowController {
    
    init() {
//        super.init(windowNibName: "AddWindowController", owner: self)
        let w = NSWindow(contentViewController: MainViewController())
        super.init(window: w)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func windowDidLoad() {
        super.windowDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
}
