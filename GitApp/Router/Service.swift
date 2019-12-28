//
//  Service.swift
//  GitApp
//
//  Created by Yogendra Shelke on 29/12/19.
//  Copyright © 2019 Yogendra Shelke. All rights reserved.
//

import Foundation


enum APIError: Error {
	case apiError
	case invalidEndpoint
	case invalidResponse
	case invalidQueryParams
	case decodeError
}

class Service {
	
	internal func fetch<T: Decodable>(urlString: String, completion: @escaping (Result<T, APIError>) -> Void) {
		guard let url = URL(string: urlString) else {
			completion(.failure(.invalidEndpoint))
			return
		}
		
		URLSession.shared.dataTask(with: url) { (result) in
			switch result {
			case .success(let (response, data)):
				guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
					completion(.failure(.invalidResponse))
					return
				}
				do {
					let values = try JSONDecoder().decode(T.self, from: data)
					completion(.success(values))
				} catch {
					completion(.failure(.decodeError))
				}
			case .failure:
				completion(.failure(.apiError))
			}
		}.resume()
	}
}
