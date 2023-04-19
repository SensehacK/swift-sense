//
//  AsyncImageCache.swift
//  
//
//  Created by Kautilya Save on 4/19/23.
//

import SwiftUI

/**
 This is custom AsyncImage View type where it stores the images in temporary memory cache
  using underlying Dictionary value type.

 This API handles making a network request, parsing Image data, storing in-memory cache and returns back `T:View` content.
 
 - Parameter url: URL
 - Parameter key: Optional String. If provided will be used or else it fallbacks on UUID().uuidString
 - Parameter content: AsyncImagePhase - It is an enum which returns us different states of the image loading phase.
 - Returns: T: View
 - Warning: This View makes asynchronous network calls and displays the value in Async manner. There are no blocking calls.
 
```
AsyncImageCache(url: url) { phase in
     switch phase {
     case .success(let image):
         image
             .frame(height: 90)
             .clipShape(Circle())
     case .empty:
         Text("Image resource empty")
     case .failure(let error):
         Text("Error fetching Image: \(error.localizedDescription)")
     default:
         Text("No Image downloaded")
     }
}
```
*/
@available(iOS 15.0, macOS 12.0, *)
public struct AsyncImageCache<T>: View where T: View {
    
    private let url: URL
    private let key: String
    private let content: (AsyncImagePhase) -> T
    
    public init(url: URL,
         key: String = UUID().uuidString,
         @ViewBuilder content: @escaping (AsyncImagePhase) -> T) {
        self.url = url
        self.key = key
        self.content = content
    }
    
    /// Returns ImageView depending on whether Image was cached earlier.
    public var body: some View {
        
        // Check for Cache Dictionary first
        if let cachedImage = CacheDictionary[key] {
            content(.success(cachedImage))
        } else {
            // Or else return the normal Network fetch image cache
            AsyncImage(url: url) { imagePhase in
                returnSuccessfulImageAndCache(phase: imagePhase)
            }
        }

    }
    
    
    func returnSuccessfulImageAndCache(phase: AsyncImagePhase) -> some View {
        if case .success(let image) = phase {
            CacheDictionary[key] = image
        }
        return content(phase)
    }
    
}
