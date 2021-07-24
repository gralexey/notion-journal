//
//  Helpers.swift
//  NotionJournal
//
//  Created by Alexey Grabik on 22.07.2021.
//

import Cocoa

func showAlert(messageText: String, informativeText: String) {
    let alert = NSAlert()
    alert.messageText = messageText
    alert.icon = NSImage(systemSymbolName: "wifi.exclamationmark", accessibilityDescription: nil)
    alert.informativeText = informativeText
    alert.addButton(withTitle: "OK")
    alert.runModal()
}

extension Date {
    
    var string: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: Date())
    }
}
