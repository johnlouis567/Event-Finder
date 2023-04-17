//
//  EventsView.swift
//  Event Finder
//
//  Created by John Ingram on 4/10/23.
//

import SwiftUI

struct EventsView: View {
//    var data: Data
    var events: [Event]
    
    var body: some View {
        HStack {
            List(events) { event in
                Text(event.name)
                    .multilineTextAlignment(.center)
                    .font(.largeTitle)
                Text("Event Date: 01/11/2023")
                Text("Price range: $55 - $678")
                Text("Event Location: " + event.locale)
                Text(event.url)
                    .foregroundColor(.blue)
                Divider()
            }
            /*.task {
                await self.data.fetchEvents()
            }*/
            /*.refreshable {
                await self.data.fetchEvents()
            }*/
            /*VStack {
                Button("Populate Events") {
                    Task {
                        await self.data.fetchEvents()
                    }
                }
                // TODO: Implement a button to refresh events?
                Button("Clear Events") {
                    events = []
                }
            }*/
        }
    }
}

/*struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}*/
