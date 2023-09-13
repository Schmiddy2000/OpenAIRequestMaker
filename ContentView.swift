//
//  ContentView.swift
//  OpenAIPackage v0.3
//
//  Created by Luca Schmitt on 13.09.23.
//

import SwiftUI

struct ContentView: View {
    
    @State var myText: String = ""
    
    var body: some View {
        
        VStack {
            
            Button {
                Task {
                    do {
                        let completion = try await OpenAI().chatCompletion()
                        myText = completion.response.choices.first?.message.content ?? "mhm"
                    } catch {
                        print(error)
                    }
                }
            } label: {
                PressMeButtonLabel()
            }
            .padding()
            
            Text(myText)
                .padding()
        }
    }
}

struct PressMeButtonLabel: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            VStack {
                Text("Hello, world!")
                Text("Press me")
            }
            .foregroundColor(.black)
        }
        .padding()
        .background(Color.pink.opacity(0.3))
        .cornerRadius(15)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
