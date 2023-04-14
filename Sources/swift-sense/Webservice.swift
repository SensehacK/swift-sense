//
//  Webservice.swift
//  
//
//  Created by Kautilya Save on 4/14/23.
//

import Foundation

public enum NetworkError: Error {
    case requestBad
    case requestDecodingFailed
}


public class Webservice {
    
    public init() { }
    
    public func fetch<T: Codable>(url: URL, parse: @escaping (Data) -> T?,
                                  completion: @escaping (Result<T?, NetworkError>) -> Void)  {
        

        URLSession.shared.dataTask(with: url) { data, response, error in
            
            // Check for HTTP status code = 200 - successful
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                completion(.failure(.requestBad))
                return
            }
                  
            
            // Check for data or error in callback
            guard let data = data,
                  error == nil else {
                completion(.failure(.requestDecodingFailed))
                return
            }
            
            // Call internal parsing closure
            let result = parse(data)
            
            // Return successful Codable value
            completion(.success(result))
            
        }.resume()
        
    }
    
}
