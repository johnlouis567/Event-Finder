//
//  EventsView.swift
//  Event Finder
//
//  Created by John Ingram on 4/10/23.
//

import SwiftUI

struct EventsView: View {
    var data: Data
    
    var body: some View {
        List(data.events) { event in
            Text(event.name)
        }
        .task {
            await self.data.fetchEvents()
        }
        .refreshable {
            await self.data.fetchEvents()
        }
    }
}

/*struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}*/
