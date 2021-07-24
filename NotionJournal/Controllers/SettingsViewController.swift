//
//  SettingsViewController.swift
//  NotionJournal
//
//  Created by Alexey Grabik on 21.07.2021.
//

import Cocoa

private let integrationKeyKey = "integration-key"
private let pageIdKey = "page-id"

class SettingsViewController: NSViewController {
    
    @IBOutlet weak var integrationTextField: NSTextField!
    @IBOutlet weak var pageTextField: NSTextField!
    
    private func setDefaults() {
        integrationTextField.stringValue = UserDefaults.standard.value(forKey: integrationKeyKey) as? String ?? ""
        pageTextField.stringValue = UserDefaults.standard.value(forKey: pageIdKey) as? String ?? ""
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDefaults()
        
        NotificationCenter.default.addObserver(forName: NSWindow.willCloseNotification, object: nil, queue: nil) { [weak self] notification in
            guard let self = self else { return }
            if  notification.object is SettingsWindow {
                self.setDefaults()
            }
        }
    }
    
    @IBAction
    func onSave(sender: NSButton) {
        UserDefaults.standard.setValue(integrationTextField.stringValue, forKey: integrationKeyKey)
        UserDefaults.standard.setValue(pageTextField.stringValue, forKey: pageIdKey)
        
        view.window?.windowController?.close()
    }
}

class SettingsWindow: NSWindow {}
