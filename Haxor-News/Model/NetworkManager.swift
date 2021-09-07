//
//  NetworkManager.swift
//  Haxor-News
//
//  Created by Fernando González on 06/09/21.
//

import Foundation


class NetworkManager: ObservableObject {
    /* With ObservableObject, this class will can share(cast) one or more properties */
    /* @Published is for notify once the property changes its value */
    @Published var posts: [Post] = []
    
    func fetchData() {
        performRequest(urlString: "https://hn.algolia.com/api/v1/search?tags=front_page")
    }
    
    /** Getting the data from the urlString API */
    func performRequest(urlString: String) {
        // Step 1: Creating the URL
        if let url: URL = URL(string: urlString) {
            // Step 2: Creating the URL Session
            let session: URLSession = URLSession(configuration: .default)
            // Step 3: Giving the session a task
            // Once the task is completed, the same task calls the completionHandler
            let task: URLSessionDataTask = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return // the return keyword stops all process
                }
                
                if let safeData: Data = data {
                    if let results: NetworkData = self.parseJSON(withData: safeData) {
                        // the value self.posts will change
                        DispatchQueue.main.async {
                            // DispatchQueue because self.posts is a @Published property
                            self.posts = results.hits
                        }
                    }
                }
            }
          // Step 4: Start the task
            task.resume()
        }
    }
    
    /** Parsing the JSON NetworkData to PostModel */
    func parseJSON(withData: Data) -> NetworkData? {
        let decoder: JSONDecoder = JSONDecoder()
        
        do {
            let decodedData: NetworkData = try decoder.decode(NetworkData.self, from: withData)
//            let id: String = decodedData.hits[0].id
//            let title: String = decodedData.hits[0].title
//            let points: Int = decodedData.hits[0].points
//            let url: String = decodedData.hits[0].url
//
//            let post = PostModel(id: id, title: title, points: points, url: url)
            
            return decodedData
            
        } catch {
            // if an error exists decodign JSON, notifies to delegate
            print(error)
            return nil
        }
    }
    
}
