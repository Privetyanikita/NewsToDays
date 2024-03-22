//
//  NetworkClient.swift
//  Network
//
//  Created by lukoom on 19.03.2024.
//

import Foundation


enum Method : String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
}

class NetworkClient {
    private let config = NetworkConfiguration()
    
    private lazy var urlSession: URLSession? = {
       let session = URLSession(configuration: .default)
       return session
    }()
    
    private var dataTask: URLSessionDataTask? = nil
    
    func request<T:Codable>(path: String, method: Method = .get, parameters: [String: String], _ headers: [String:String] = [String:String](), completion: @escaping(Result<T?,Error>)->Void) {
        
        let apiUrlPath = "\(config.getBaseUrl())\(path)"
        guard let url = URL(string: apiUrlPath) else {
            DispatchQueue.main.async {
                completion(.failure(CustomError(message: "Empty url")))
            }
            return
        }
        
        var urlRequest = URLRequest(url: url)
        let hHeaders = config.getHeaders()
        for header in hHeaders {
            urlRequest.setValue(header.value, forHTTPHeaderField: header.key)
        }
        
        self.dataTask = urlSession?.dataTask(with: urlRequest, completionHandler: { data, responce, error in
            if let data = data {
                let json = String(data: data, encoding: .utf8)
                print(json)
                let content = JsonDecoderHelper.jsonDecodeHelper.decode(data: data, type: T.self)
                DispatchQueue.main.async {
                    completion(.success(content))
                }
               
            } else {
                DispatchQueue.main.async {
                    completion(.failure(CustomError(message: "No data")))
                }
            }
        })
        self.dataTask?.resume()
    }
}

