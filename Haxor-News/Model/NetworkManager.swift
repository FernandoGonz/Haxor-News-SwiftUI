//
//  NetworkManager.swift
//  Haxor-News
//
//  Created by Fernando González on 06/09/21.
//

import Foundation

struct NetworkManager {
    
    func fetchData() {
        performRequest(urlString: "https://hn.algolia.com/api/v1/search?tags=front_page")
    }
    
    func performRequest(urlString: String) {
        // Step 1: Creating the URL
        if let url: URL = URL(string: urlString) {
            // Step 2: Creating the URL Session
            let session: URLSession = URLSession(configuration: .default)
            // Step 3: Giving the session a task
            // Once the task is completed, the same task calls the completionHandler
            let task: URLSessionDataTask = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    // Exists an error in Networking, NetworkManager will notifies to delegate
                    // CODE HERE
                    return // the return keyword stops all process
                }
                
                if let safeData: Data = data {
                    do {
                        let decoder = JSONDecoder()
                        try let results: NetworkData = decoder.decode(NetworkData.self, from: safeData)
                    } catch {
                        print(error)
                    }
                }
            }
          // Step 4: Start the task
            task.resume()
        }
    }
    
}
