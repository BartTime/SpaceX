//
//  NetworkService.swift
//  SnapkitTest
//
//  Created by Alex on 16.08.2022.
//

import Foundation
import UIKit

protocol NetworkServiceProtocol {
    func getInfoAboutRockets(completion: @escaping (Result<[InfoForRocket]?, Error>) -> Void)
   
}

class NetworkService: NetworkServiceProtocol {
    func getInfoAboutRockets(completion: @escaping (Result<[InfoForRocket]?, Error>) -> Void) {
        let urlString = "https://api.spacexdata.com/v4/rockets"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            guard let data = data else {
                completion(.failure(error as! Error))
                return
            }
            do {
                let obj = try JSONDecoder().decode([InfoForRocket].self, from: data)
                print(obj)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }

        }.resume()
    }
    
}
