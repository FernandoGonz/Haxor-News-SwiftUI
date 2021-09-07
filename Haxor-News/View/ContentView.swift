//
//  ContentView.swift
//  Haxor-News
//
//  Created by Fernando González on 05/09/21.
// git repository: https://github.com/FernandoGonz/Haxor-News-SwiftUI.git

import SwiftUI

struct ContentView: View {
    
    // @ObservedObject is for listen when one or more properties is changing and we can get the new value
    // @ObservedObject subcribes to updates
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink( // to show the icon > clickeable
                    destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationBarTitle("HAXOR NEWS")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone XR"))
    }
}

