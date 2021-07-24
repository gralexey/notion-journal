//
//  AddViewController.swift
//  NotionJournal
//
//  Created by Alexey Grabik on 20.07.2021.
//

import Cocoa

class MainViewController: NSViewController {
    
    @IBOutlet weak var settingsButton: NSButton!
    @IBOutlet weak var textArea: NSTextView!
    private let settingsMenu = NSMenu(title: "Menu")
    
    private let wc: NSWindowController = {
        let window = SettingsWindow(contentViewController: SettingsViewController())
        window.minSize = window.frame.size
        window.maxSize = window.frame.size
        window.styleMask = [.closable, .titled]
        window.title = "Settings"
        return NSWindowController(window: window)
    }()

    private let client = Client()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let addItem = NSMenuItem(title: "Settings...", action:  #selector(onSettings), keyEquivalent: "")
        settingsMenu.addItem(addItem)
        addItem.target = self
        let quitItem = NSMenuItem(title: "Quit", action:  #selector(onQuit), keyEquivalent: "")
        settingsMenu.addItem(quitItem)
        quitItem.target = self
        
        settingsMenu.autoenablesItems = true
    }
    
    @IBAction
    private func send(_ sender: NSButton) {
        client.send(blockHeader: Date().string,
                    blockText: textArea.string) { [weak self] success in
            guard let self = self else { return }
            if success {
                self.textArea.string = ""
                self.view.window?.close()
            }
            else {
                showAlert(messageText: "Error", informativeText: "Error connecting to the servers, please try again")
            }
        }
    }

    @objc
    private func onSettings(_ sender: NSView) {
        wc.showWindow(self)
        NSApp.activate(ignoringOtherApps: true)
    }
    
    @objc
    private func onQuit() {
        NSApp.terminate(nil)
    }
    
    @IBAction
    func onMenu(_ sender: NSView) {
        let p = NSPoint(x: 0, y: sender.frame.height)
        settingsMenu.popUp(positioning: nil, at: p, in: sender)
    }
}
