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
            HStack {
                Text("Fetch new user")
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Text("GET")
                        .frame(width: 80)
                })
                .buttonStyle(.bordered)
                .tint(.blue)
            }
            
            HStack {
                Text("Add user")
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Text("POST")
                        .frame(width: 80)
                })
                .buttonStyle(.bordered)
                .tint(.green)
            }
            
            HStack {
                Text("Update user")
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Text("PUT")
                        .frame(width: 80)
                })
                .buttonStyle(.bordered)
                .tint(.orange)
            }
            
            HStack {
                Text("Delete user")
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Text("DELETE")
                        .frame(width: 80)
                })
                .buttonStyle(.bordered)
                .tint(.red)
            }
            
            Spacer()
        }
        .padding()
        .task {
            let result = await store.getUser()
            switch result {
            case .success(let user):
                print("name: \(user.firstName) \(user.lastName)")
                print(user.avatarURL)
            case .failure(let error):
                print("error")
            }
        }
    }
}

#Preview {
    ContentView()
}
