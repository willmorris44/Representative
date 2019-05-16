//
//  RepresentativeController.swift
//  Representative
//
//  Created by Will morris on 5/16/19.
//  Copyright © 2019 devmtn. All rights reserved.
//

import Foundation

class RepresentativeController {

    static var baseURL = URL(string: "https://whoismyrepresentative.com/getall_reps_bystate.php?")
    
    static func searchRepresentatives(forState state: String, completion: @escaping ([Representative]) -> Void) {
        guard let url = baseURL else { completion([]); return }
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        let stateQuery = URLQueryItem(name: "state", value: getStateAbbreviation(state: state))
        let outputQuery = URLQueryItem(name: "output", value: "json")
        
        components?.queryItems = [stateQuery, outputQuery]
        
        guard let finalURL = components?.url else { completion([]); return }
        
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print("There was an error fetching items: \(error.localizedDescription)")
                completion([])
                return
            }
            
            guard let data = data,
                let responseDataString = String(data: data, encoding: .ascii),
                let fixedDataString = responseDataString.data(using: .utf8) else { completion([]); return }
            
            do {
                
                let representative = try JSONDecoder().decode(TopLevelDict.self, from: fixedDataString)
                let repResults = representative.results
                completion(repResults)
                return
            } catch {
                print("There was an error decoding: \(error.localizedDescription)")
                completion([])
                return
            }
        }.resume()
    }
    
    static func getStateAbbreviation(state: String) -> String{
        switch state.lowercased() {
        case "alabama":
            return "AL"
        case "alaska":
            return "AK"
        case "american samoa":
            return "AS"
        case "arizona":
            return "AZ"
        case "arkansas":
            return "AR"
        case "california":
            return "CA"
        case "colorado":
            return "CO"
        case "connecticut":
            return "CT"
        case "district of columbia":
            return "DC"
        case "delaware":
            return "DE"
        case "florida":
            return "FL"
        case "georgia":
            return "GA"
        case "hawaii":
            return "HI"
        case "idaho":
            return "ID"
        case "illinois":
            return "IL"
        case "indiana":
            return "IN"
        case "iowa":
            return "IA"
        case "kansas":
            return "KS"
        case "kentucky":
            return "KY"
        case "louisiana":
            return "LA"
        case "maine":
            return "ME"
        case "maryland":
            return "MD"
        case "massachusetts":
            return "MA"
        case "michigan":
            return "MI"
        case "minnesota":
            return "MN"
        case "mississippi":
            return "MS"
        case "missouri":
            return "MO"
        case "montana":
            return "MT"
        case "nebraska":
            return "NE"
        case "nevada":
            return "NV"
        case "new hampshire":
            return "NH"
        case "new jersey":
            return "NJ"
        case "new mexico":
            return "NM"
        case "new york":
            return "NY"
        case "north carolina":
            return "NC"
        case "north dakota":
            return "ND"
        case "ohio":
            return "OH"
        case "oklahoma":
            return "OK"
        case "oregon":
            return "OR"
        case "pennsylvania":
            return "PA"
        case "puerto rico":
            return "PR"
        case "rhode island":
            return "RI"
        case "south carolina":
            return "SC"
        case "south dakota":
            return "SD"
        case "tennessee":
            return "TN"
        case "texas":
            return "TX"
        case "utah":
            return "UT"
        case "vermont":
            return "VT"
        case "virginia":
            return "VA"
        case "washington":
            return "WA"
        case "west virginia":
            return "WV"
        case "wisconsin":
            return "WI"
        case "wyoming":
            return "WY"
        default:
            return ""
        }
    }
}
