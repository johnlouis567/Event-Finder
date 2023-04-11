//
//  EventsSummary.swift
//  Event Finder
//
//  Created by John Ingram on 4/10/23.
//

// The structure for this API call was inspired by https://www.ralfebert.com/ios-app-development/swiftui-async-await-tutorial/

import Foundation

@MainActor
class EventsSummary: ObservableObject {
    @Published var events: [Event] = []
    let apiKey = "5f3VlQegvbNmEFdPG3AUHB9FFTRswMDX"
    
    func fetchEvents() async {
        let url = URL(string: "https://app.ticketmaster.com/discovery/v2/events?apikey=\(apiKey)")
        
        // Unwrap the url to make sure that it is not null
        guard let unwrappedUrl = url else {
            // TODO: Implelemnt an error
            print("There was an error unwrapping the URL")
            return
        }
        
        let session = URLSession.shared
        do {
            let (data, _) = try await session.data(from: unwrappedUrl)
            let decoder = JSONDecoder()
            self.events = try decoder.decode([Event].self, from: data)
        } catch {
            debugPrint("Error loading \(String(describing: url)): \(String(describing: error))")
        }
    }
    
    /*func fetchEvents() -> [Event] {
        Task {
            do {
                await fetchEvents()
            } catch {
                print(error)
            }
        }
    }*/
}
