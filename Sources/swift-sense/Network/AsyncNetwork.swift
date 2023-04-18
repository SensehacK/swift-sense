//
//  AsyncNetwork.swift
//  
//
//  Created by Kautilya Save on 4/17/23.
//

import Foundation


@available(iOS 13.0, macOS 10.15, *)
public class AsyncNetwork {
    
    
    // Private properties
    private init() { }
    
    /// Singleton
    /**
    Creates a singleton object of AsyncNetwork class in order to make network request using Apple's Swift Concurrency `Async/Await`
   */
    public static let shared = AsyncNetwork()
    
    
    /**
     Makes a network request using Combine framework with type T: Codable and returns `Future<Result<T:Decodable, Error>>`.
    
    This API handles making a network request, parsing of network response into JSON data as long as the model <T> conforms to Protocol `Decodable`.
     
     - Parameter url: URL
     - Parameter type: Type of Model conforming to Decodable. Helps swift generic inference
     - Returns: async throws -> T
     - Warning: Async Await APIs could be limited to specific iOS versions.
     
    ```
     @Published var meals: Meal

     func fetchRecipe() async {
         do {
             let recipe = try await AsyncNetwork.shared.fetchData(url: Constants.mealAPIURL, type: MealModel.self)
             meals = recipe
         } catch {
             print(error)
         }
     }
    ```
    */
    public func fetchData<T: Decodable>(url: String, id: Int? = nil, type: T.Type) async throws -> T {
        guard let url = URL(string: url) else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.isResponseOK() else {
            throw NetworkError.requestBad
        }
        
        guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
            throw NetworkError.requestBadDecoding
        }
        
        return decodedData
    }
    
    
    /**
     Makes a network request using Combine framework with type T: Codable and returns `Future<Result<[T:Decodable], Error>>`.
    
    This API handles making a network request, parsing of network response into JSON data as long as the model <T> conforms to Protocol `Decodable`.
     
     - Parameter url: URL
     - Parameter type: Type of Model conforming to Decodable. Helps swift generic inference
     - Returns: async throws -> T
     - Warning: Async Await APIs could be limited to specific iOS versions.
     
    ```
     @Published var meals: [Meal] = []

     func fetchRecipes() async {
         do {
             let recipes = try await AsyncNetwork.shared.fetchDataArray(url: Constants.mealAPIURL, type: MealModel.self)
             meals = recipes
         } catch {
             print(error)
         }
     }
     }
    ```
    */
    public func fetchDataArray<T: Decodable>(url: String, id: Int? = nil, type: T.Type) async throws -> [T] {
        guard let url = URL(string: url) else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.isResponseOK() else {
            throw NetworkError.requestBad
        }
        
        guard let decodedData = try? JSONDecoder().decode([T].self, from: data) else {
            throw NetworkError.requestBadDecoding
        }
        
        return decodedData
    }
    
    
}
