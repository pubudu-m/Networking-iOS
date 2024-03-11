//
//  ContentView.swift
//  Networking
//
//  Created by Idirimuni Pubudu Mihiranga De Silva on 2024-03-04.
//

import SwiftUI

struct ContentView: View {
    let store = DummyJsonStore()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .task {
            let result = await store.getUser()
            switch result {
            case .success(let user):
                print("name: \(user.firstName) \(user.lastName)")
            case .failure(let error):
                print("error")
            }
        }
    }
}

#Preview {
    ContentView()
}
