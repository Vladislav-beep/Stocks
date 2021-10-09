//
//  Network Manager.swift
//  Stocks
//
//  Created by Владислав Сизонов on 09.10.2021.
//

import Foundation

enum GetDataError: Error {
    case url
    case parse
    case internet
    
    var message: String {
        switch self {
        case .url:
            return "Неправильный  URL"
        case .parse:
            return "Данные некорректны"
        case .internet:
            return "Нет сети"
        }
    }
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(from UrlString: String, completion: @escaping (Result<[Stock], GetDataError>) -> Void) {
        
        guard let url = URL(string: UrlString) else { completion(.failure(.url)); return }
        
        URLSession.shared.dataTask(with: url) { data, _ , error in
            if let _ = error {
                completion(.failure(.internet))
                return
            }
            guard let data = data else { completion (.failure(.parse))
                return
            }
            
            do {
                let stocks = try JSONDecoder().decode([Stock].self, from: data)
                completion(.success(stocks))
                
            } catch {
                completion(.failure(.parse))
            }
            
        }.resume()
    }
    
    
    func fetchImageV1(for symbol: String, completion: @escaping (Result<String, GetDataError>) -> Void) {
          
      let imageUrl = URL(string: "https://cloud.iexapis.com/stable/stock/\(symbol)/logo?&token=pk_c84a989527b9487e91f71d181a869967")!
      
          
          URLSession.shared.dataTask(with: imageUrl) { data, _ , error in
              if let error = error {
                 print(error)
                  return
              }
              guard let data = data else { completion (.failure(.parse))
                  return
              }
              
              do {
                
                let logo = try JSONDecoder().decode(Logo.self, from: data)
                guard let url = logo.url else { return }
                completion(.success(url))
                
              } catch {
                  completion(.failure(.parse))
              }
              
          }.resume()
      }
    
    func fetchImage(for url: String, completion: @escaping (Result<Data, GetDataError>) -> Void) {
        guard let url = URL(string: url) else { return }
        
          URLSession.shared.dataTask(with: url) { data, _ , error in
              if let error = error {
                 print(error)
                  return
              }
              
            if let data = data {
                completion(.success(data))
            }
              
          }.resume()
    }
    
}

    
