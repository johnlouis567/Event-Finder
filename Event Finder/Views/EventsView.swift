//
//  EventsView.swift
//  Event Finder
//
//  Created by John Ingram on 4/10/23.
//

import SwiftUI

struct EventsView: View {
    @StateObject var eventsSummary = EventsSummary()
    
    var body: some View {
        List(eventsSummary.events) { event in
            Text(event.name)
        }
        .task {
            await self.eventsSummary.fetchEvents()
        }
        .refreshable {
            await self.eventsSummary.fetchEvents()
        }
    }
}

/*struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}*/
