//
//  CombineNetwork.swift
//  
//
//  Created by Kautilya Save on 4/15/23.
//

import Foundation
import Combine


@available(macOS 10.15, *)
@available(iOS 13.0, *)
public class CombineNetwork {
    
    
    // Private properties
    private var disposeBag = Set<AnyCancellable>()
    private init() { }
    
    /// Singleton
    /**
    Creates a singleton object of CombineNetwork class in order to make network request using Apple's Reactive framework `Combine`
   */
    public static let shared = CombineNetwork()
    
    
    /**
     Makes a network request using Combine framework with type T: Codable and returns `Future<Result<T:Decodable, Error>>`.
    
    This API handles making a network request, parsing of network response into JSON data as long as the model <T> conforms to Protocol `Decodable`.
     
     - Parameter url: URL
     - Parameter type: Type of Model conforming to Decodable. Helps swift generic inference
     - Returns: Future<T, Error>
     - Warning: Safely storing of the subscribes needs to be done via storing the sink return value in `AnyCancellable`.
     
    ```
     var cancellables = Set<AnyCancellable>()
     var quotes: Quotes = []
     
     CombineNetwork.shared.fetchData(url: "https://dummyjson.com/quotes", type: Quotes.self)
        .sink { completion in
            switch completion {
                case .failure(let error):
                    print("Error")
                case .finished:
                    print("Finish")
            }
        }
        receiveValue: { [weak self] quotesData in
            self?.quotes = quotesData
        }
        .store(in &cancellables)
     }
    ```
    */
    public func fetchData<T: Decodable>(url: String, id: Int? = nil, type: T.Type) -> Future<T, Error> {
        return Future<T, Error> { [weak self] promise in
            var tempUrl: String
            // Check for extra ID parameter
            if let id = id {
                tempUrl = url + "\(id)"
            } else {
                tempUrl = url
            }
            
            guard let self = self,
                  let url = URL(string: tempUrl) else {
                return promise(.failure(NetworkError.invalidURL))
            }
            
            URLSession.shared.dataTaskPublisher(for: url)
                .tryMap { data, response -> Data in
                    guard let response = response as? HTTPURLResponse,
                          response.isResponseOK() else {
                        throw NetworkError.requestBad
                    }
                    return data
                }
                .decode(type: T.self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink { completion in
                    if case let .failure(error) = completion {
                        switch error {
                        case let decodingError as DecodingError:
                            promise(.failure(decodingError))
                        case let apiError as NetworkError:
                            promise(.failure(apiError))
                        default:
                            promise(.failure(NetworkError.unknown))
                        }
                    }
                } receiveValue: {
                    promise(.success($0))
                }
                .store(in: &self.disposeBag)
        }
    }
    
    
    /**
     Makes a network request using Combine framework with type T: Codable and returns `Future<Result<[T:Decodable], Error>>`.
    
    This API handles making a network request, parsing of network response into JSON data as long as the model <T> conforms to Protocol `Decodable`.
     
     - Parameter url: URL
     - Parameter type: Type of Model conforming to Decodable. Helps swift generic inference
     - Returns: Future<[T], Error>
     - Warning: Safely storing of the subscribes needs to be done via storing the sink return value in `AnyCancellable`.
     
    ```
     var cancellables = Set<AnyCancellable>()
     var quotes: [Quotes] = []
     
     CombineNetwork.shared.fetchData(url: "https://dummyjson.com/quotes", type: Quotes.self)
        .sink { completion in
            switch completion {
                case .failure(let error):
                    print("Error")
                case .finished:
                    print("Finish")
            }
        }
        receiveValue: { [weak self] quotesData in
            self?.quotes = quotesData
        }
        .store(in &cancellables)
     }
    ```
    */
    public func fetchData<T: Decodable>(url: String, id: Int? = nil, type: T.Type) -> Future<[T], Error> {
        return Future<[T], Error> { [weak self] promise in
            
            guard let self = self,
                  let url = URL(string: url) else {
                return promise(.failure(NetworkError.invalidURL))
            }
            
            URLSession.shared.dataTaskPublisher(for: url)
                .tryMap { data, response -> Data in
                    guard let response = response as? HTTPURLResponse,
                          response.isResponseOK() else {
                        throw NetworkError.requestBad
                    }
                    return data
                }
                .decode(type: [T].self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink { completion in
                    if case let .failure(error) = completion {
                        switch error {
                        case let decodingError as DecodingError:
                            promise(.failure(decodingError))
                        case let apiError as NetworkError:
                            promise(.failure(apiError))
                        default:
                            promise(.failure(NetworkError.unknown))
                        }
                    }
                } receiveValue: {
                    promise(.success($0))
                }
                .store(in: &self.disposeBag)
        }
    }
    
    
}
