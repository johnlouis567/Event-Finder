//
//  Data.swift
//  Event Finder
//
//  Created by John Ingram on 4/11/23.
//

import Foundation

@MainActor
class Data: ObservableObject {
    var _embedded: [String : Any] = [:]
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
            self._embedded = try decoder.decode([String : [Event]].self, from: data)
            
            // Generate the list of events ffrom the _embedded file
            for (key, value) in _embedded {
                if key == "events" {
                    self.events = value
                }
            }
        } catch {
            debugPrint("Error loading \(String(describing: url)): \(String(describing: error))")
        }
    }
}
