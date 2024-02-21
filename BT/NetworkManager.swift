//
//  NetworkManager.swift
//  BT
//
//  Created by Mahima Personal on 21/02/24.
//

import Foundation
class NetworkManager {
    
    func getData(pageNum: Int, completion: @escaping (CompleteData) -> () ) {
        var urlString = "https://reqres.in/api/users?page="
        urlString += "\(pageNum)"
    
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: URLRequest(url: url)) {data,response,error in
            if let data = data {
                do {
                    
                    let decodeData = try JSONDecoder().decode(CompleteData.self, from: data)
                    print(decodeData)
                    completion(decodeData)
                } catch {
                    print("error in conversion")
                }
            }
        }.resume()
    }
    
}

