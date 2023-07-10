//
//  NetworkManager.swift
//  PhinconAttendance
//
//  Created by Dimas Wisodewo on 10/07/23.
//

import UIKit

enum APIError: Error {
    
    case failedToCreateURL
    case failedToGetData
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func sendRequest(with request: URLRequest, completion: @escaping (Result<(Data?, URLResponse?, Error?), Error>) -> Void) {
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, error != nil {
                completion(.success((data, response, error)))
            } else {
                completion(.failure(APIError.failedToGetData))
            }
        }.resume()
    }
    
}
