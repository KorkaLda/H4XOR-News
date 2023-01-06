//
//  ContentView.swift
//  H4XOR News
//
//  Created by Vladimir on 04.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        VStack {
                            Text(String(post.points))
                                .bold()
                            Image(systemName: "chevron.compact.up")
                                .foregroundColor(.green)
                        }
                        
                        VStack {
                            Text(post.title)
                                .padding()
                            Text("Комментарии: \(String( post.num_comments))")
                        }
                        
                    }
                }
                
                
            }
            .navigationBarTitle("H4X0R НОВОСТИ")
            //.foregroundColor(.blue)
        }
        .onAppear{
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
