//
//  NetworkManager.swift
//  AirgurtStore
//
//  Created by Роман Анпилов on 24.06.2022.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private let mainUrl = "https://itunes.apple.com/"
    
    func fetchAppData(appId: String, completion: @escaping (Result<SearchResult, Error>) -> ()) {
        print(appId)
        let url = "\(mainUrl)lookup?id=\(appId)"
        fetchJSONData(urlString: url, completion: completion)
    }
    
    func fetchApps(appTerm: String, completion: @escaping (Result<SearchResult, Error>) -> ()) {
        let url = "\(mainUrl)search?term=\(appTerm)&entity=software"
        fetchJSONData(urlString: url, completion: completion)
    }
    
    func fetchAppGroup(typeResponse: AppsCategory, completion: @escaping (Result<AppGroup, Error>) -> ()) {
        fetchJSONData(urlString: typeResponse.rawValue, completion: completion)
    }
    
    func fetchSocialApp(completion: @escaping (Result<[SocialApp], Error>) -> ()) {
        let url = "https://api.letsbuildthatapp.com/appstore/social"
        fetchJSONData(urlString: url, completion: completion)
    }
    
    func fetchJSONData<T: Decodable>(urlString: String, completion: @escaping (Result<T, Error>) -> ()) {
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) {data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            guard let data = data else {return}
            do {
                let dataJSON = try JSONDecoder().decode(T.self, from: data)
                completion(.success(dataJSON))
            } catch let error {
                completion(.failure(error))
            }
        }.resume()
    }
}
