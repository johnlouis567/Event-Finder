//
//  Data.swift
//  Event Finder
//
//  Created by John Ingram on 4/11/23.
//

import Foundation

@MainActor
class Data: ObservableObject {
    var embeddedData = EmbeddedData()
    // TODO: Do this in a more SWIFTY way using the data model
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
            embeddedData.self = try decoder.decode(EmbeddedData.self, from: data)
            
            // Create an eventsList array so that it updates all at once instead of piece by piece
            var eventsList: [Event] = []
            
            
            // Generate the list of events ffrom the _embedded file
            for event in embeddedData._embedded.events {
                eventsList.append(event)
            }
        
            self.events = eventsList
        } catch {
            debugPrint("Error loading \(String(describing: url)): \(String(describing: error))")
        }
    }
}




// TASK from async await:
// JUST FOR FUTURE REFERENCE IN CASE I HAVE TO CHANGE ASYNC FUNC

/*Task {
     do {
         thing = await asyncFunc();
     } catch {
         print(error)
     }
 }*/
 
