//
//  StatusBarController.swift
//  NotionJournal
//
//  Created by Alexey Grabik on 17.07.2021.
//

import AppKit
import Foundation

class StatusBarController {
    
    init() {
        statusBar = NSStatusBar()
        statusItem = statusBar.statusItem(withLength: 28.0)
        
        if let statusBarButton = statusItem.button {
            statusBarButton.image = NSImage(systemSymbolName: "calendar", accessibilityDescription: nil)
            statusBarButton.image?.size = NSSize(width: 18.0, height: 18.0)
            statusBarButton.image?.isTemplate = true
            statusBarButton.action = #selector(onOpen)
            statusBarButton.target = self
        }
    }
    
    private var statusBar: NSStatusBar
    
    private var statusItem: NSStatusItem
    
    private let popover: NSPopover = {
        let popover = NSPopover()
        popover.contentViewController = MainViewController()
        popover.behavior = .transient
        return popover
    }()
    
    @objc func onOpen() {
        popover.show(relativeTo: statusItem.button!.frame, of: statusItem.button!, preferredEdge: NSRectEdge.minY)
    }

    @objc func onQuit() {
        NSApplication.shared.terminate(self)
    }
}
