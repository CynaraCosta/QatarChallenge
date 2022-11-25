//
//  ContentView.swift
//  testinhoTV
//
//  Created by Cynara Costa on 25/11/22.
//

import SwiftUI

struct GameView: View {
    
    @State var buttonTracker = "Press something!"
    @ObservedObject var viewModel = CardPlayerViewModel()
    
    var body: some View {
        VStack {
            Text(buttonTracker)
            
            Button(action: {
                self.buttonTracker = "You pressed Button 1!"
            }) {
                Text("Button 1")
            }
            
            Button(action: {
                self.buttonTracker = "You pressed Button 2!"
            }) {
                Text("Button 2")
            }
            
            Button(action: {
                self.buttonTracker = "You pressed the heart!"
            }) {
                Image(systemName: "heart")
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
