//
//  NetworkError.swift
//  
//
//  Created by Kautilya Save on 4/15/23.
//

import Combine


public enum NetworkError: Error {
    case requestBad
    case requestDataFailedNetworkError
    case invalidURL
    case requestBadDecoding
    case unknown
}
