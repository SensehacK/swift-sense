//
//  Webservice.swift
//  
//
//  Created by Kautilya Save on 4/14/23.
//

import Foundation

public enum NetworkError: Error {
    case requestBad
    case requestDataFailed
}


public class Webservice {
    
    public init() { }

    /**
     Makes a network request using Generic type T: Codable and returns the two completioner handlers - Parsing & Result Type.
    
    Consuming this API is quite easy and it also gives us an option to parse the network data response in the completion handler
     
     - Parameter url: URL
     - Parameter parse: Call internal parsing closure
     - Parameter completion: Return Result(success, failure) `T:Codable` value
     - Returns: Result<T? ,Error>
     - Warning: Safely unwraping of `T:Codable` is consumer's responsibility.
     
    ```
     Webservice().fetch(url: url) { data in
         return try? JSONDecoder().decode([T].self, from: data)
     } completion: { result in
         switch result {
         case .success(let data):
             guard let data = data else { return }
             DispatchQueue.main.async {
                 self.dataStruct = data
             }
         case .failure(let error):
             print(error)
         }
     }
    ```
    */
    public func fetch<T: Codable>(url: URL, parse: @escaping (Data) -> T?,
                                  completion: @escaping (Result<T?, NetworkError>) -> Void)  {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let response = response as? HTTPURLResponse,
                  response.isResponseOK() else {
                completion(.failure(.requestBad))
                return
            }

            // Check for data or error in callback
            guard let data = data,
                  error == nil else {
                completion(.failure(.requestDataFailed))
                return
            }
            
            let result = parse(data)
            completion(.success(result))
        }.resume()
        
    }
    
    /**
     Makes a network request using Generic type T: Codable and returns the two completioner handlers - Parsing & Result Type.
    
    Consuming this API is quite easy and it also gives us an option to parse the network data response in the completion handler
     
     - Parameter urlRequest: URLRequest
     - Parameter parse: Call internal parsing closure
     - Parameter completion: Return Result(success, failure) `T:Codable` value
     - Returns: Result<T? ,Error>
     - Warning: Safely unwraping of `T:Codable` is consumer's responsibility.
     
    ```
     Webservice().fetch(urlRequest: urlRequest) { data in
         return try? JSONDecoder().decode([T].self, from: data)
     } completion: { result in
         switch result {
         case .success(let data):
             guard let data = data else { return }
             DispatchQueue.main.async {
                 self.dataStruct = data
             }
         case .failure(let error):
             print(error)
         }
     }
    ```
    */
    public func fetch<T: Codable>(urlRequest: URLRequest, parse: @escaping (Data) -> T?,
                                  completion: @escaping (Result<T?, NetworkError>) -> Void)  {
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let response = response as? HTTPURLResponse,
                  response.isResponseOK() else {
                completion(.failure(.requestBad))
                return
            }

            // Check for data or error in callback
            guard let data = data,
                  error == nil else {
                completion(.failure(.requestDataFailed))
                return
            }
            
            let result = parse(data)
            completion(.success(result))
        }.resume()
        
    }

}
