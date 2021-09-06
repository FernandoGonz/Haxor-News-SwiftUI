//
//  ContentView.swift
//  Haxor-News
//
//  Created by Fernando González on 05/09/21.
// git repository: https://github.com/FernandoGonz/Haxor-News-SwiftUI.git

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(posts) { post in
                // for any post in posts List do:
                Text(post.title)
            }
            .navigationBarTitle("HAXOR NEWS")
        }
    }
}

/** Creating a Post struct with protocol Identifiable */
/* This protocol allows the list can recognizes the order of our objects. */
struct Post: Identifiable {
    // You need an identifier to Identifiable protocol
    let id: String
    let title: String
}

/* Creting a List post of Post struct */
let posts: [Post] = [
    Post(id: "1", title: "Hola"),
    Post(id: "2", title: "Mundo"),
    Post(id: "3", title: "Bye Mundo")
]

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone XR"))
    }
}

