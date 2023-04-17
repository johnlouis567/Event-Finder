//
//  EventSelectionView.swift
//  Event Finder
//
//  Created by John Ingram on 4/16/23.
//

import SwiftUI

struct EventSelectionView: View {
    var body: some View {
        var data: Data
        
        VStack {
            Button("Populate Events") {
                Task {
                    await self.data.fetchEvents()
                }
            }
            // TODO: Implement a button to refresh events?
            Button("Clear Events") {
                events = []
            }
        }
    }
}

/*struct EventSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        EventSelectionView()
    }
}*/
