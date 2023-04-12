//
//  ContentView.swift
//  Event Finder
//
//  Created by John Ingram on 4/10/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var data = Data()
    
    var body: some View {
        VStack {
            EventsView(data: data)
        }
        .padding()
    }
}

/*struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}*/
