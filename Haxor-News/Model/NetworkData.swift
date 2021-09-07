//
//  NetworkData.swift
//  Haxor-News
//
//  Created by Fernando González on 06/09/21.
//

import Foundation

struct NetworkData: Codable {
    // you need to name the properties as the same name and type that the JSON data
    let hits: [Post]
}

/* Identifiable: this protocol allows the list can recognizes the order of our objects. */
struct Post: Codable, Identifiable {
    // You need an identifier property to Identifiable protocol
    var id: String { // Calculated variable
        return self.objectID
    }
    let objectID: String
    let title: String
    let points: Int
    let url: String?
}

/* JSON
 "hits": [
    {
        "created_at": "2019-09-08t19",
        "title": "Joi Ito Resigns",
        "points": 644,
        "url": "https:www.blablabla",
        "author": "Anon84",
        "story_id": 34534,
        "objectID": "2554"
    }
 ]
 */
