//
//  Decodable.swift
//  
//
//  Created by Kautilya Save on 4/17/23.
//

import Foundation

// Source: https://stackoverflow.com/a/73789534/5177704

public extension Decodable {
    

    /**
     Read local JSON file and parse it in Codable Models

     - Parameter localJSON: Filename of JSON in string
     - Parameter bundle: Defaults to `main` bundle
     - Returns: Result<Self, JSONParseError>
     - Warning: This is only available for `Decodable` but anyone who conforms to `Codable` should be fine.
     
    ```swift
     switch MealDetail.from(localJSON: "Local_JSON_Name") {
     case .success(let value):
         print(value)
     case .failure(let error):
         print(error)
    ```
    */
    static func from(localJSON filename: String,
                     bundle: Bundle = .main) -> Result<Self, JSONParseError> {
        guard let url = bundle.url(forResource: filename, withExtension: "json") else {
            return .failure(.fileNotFound)
        }
        let data: Data
        do {
            data = try Data(contentsOf: url)
        } catch let error {
            return .failure(.dataInitialisation(error: error))
        }

        do {
            return .success(try JSONDecoder().decode(self, from: data))
        } catch let error {
            return .failure(.decoding(error: error))
        }
    }
}
