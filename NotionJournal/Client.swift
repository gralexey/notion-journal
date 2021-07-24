//
//  Client.swift
//  NotionJournal
//
//  Created by Alexey Grabik on 17.07.2021.
//

import Foundation

class Client {

    func send(blockHeader: String, blockText: String, callback: @escaping ((Bool) -> Void)) {
        let NOTION_KEY = UserDefaults.standard.value(forKey: "integration-key") as? String ?? ""
        let pageId = UserDefaults.standard.value(forKey: "page-id") as? String ?? ""
        
        var URLRequest = URLRequest(url: URL(string: "https://api.notion.com/v1/blocks/\(pageId)/children")!)
        URLRequest.httpMethod = "PATCH"
        URLRequest.setValue("Bearer \(NOTION_KEY)", forHTTPHeaderField: "Authorization")
        URLRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        URLRequest.setValue("2021-05-13", forHTTPHeaderField: "Notion-Version")
        
        let bodyDict = [
              "children": [
                  [
                      "object": "block",
                      "type": "heading_2",
                      "heading_2": [
                          "text": [[ "type": "text", "text": [ "content": blockHeader ] ]]
                      ]
                  ],
                  [
                      "object": "block",
                      "type": "paragraph",
                      "paragraph": [
                          "text": [
                              [
                                  "type": "text",
                                  "text": [
                                      "content": blockText
                                  ]
                              ]
                          ]
                      ]
                  ]
              ]
          ]
        
        let bodyData = try? JSONSerialization.data(withJSONObject: bodyDict, options: [])
        
        URLRequest.httpBody = bodyData
        
        URLSession.shared.dataTask(with: URLRequest) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    NSLog("error: \(error.localizedDescription)")
                    callback(false)
                    return
                }
                let isAlright = (response as? HTTPURLResponse)?.statusCode == 200
                callback(isAlright)
            }
        }.resume()
    }
}
