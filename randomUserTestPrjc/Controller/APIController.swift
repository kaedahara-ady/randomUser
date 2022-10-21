//
//  APIController.swift
//  randomUserTestPrjc
//
//  Created by OverPowerPWND Keeper83 on 20/10/22.
//

import Foundation

class APIController {
    
    var users: [User] = []
    let baseURL = URL(string: "https://randomuser.me/api/?format=json&results")!
    typealias CompletionHandler = (Error?) -> Void
    
    func getUser(completion: @escaping CompletionHandler = { _ in }) {
        URLSession.shared.dataTask(with: baseURL) { (data, response, error) in
            if let error = error {
                NSLog("Error getting users: \(error)")
            }
            
            guard let data = data else {
                NSLog("No data returned from data task.")
                completion(nil)
                return
            }
            
            do {
                let newUser = try JSONDecoder().decode(UserResult.self, from: data)
                print(newUser)
                self.users = newUser.results
            } catch {
                NSLog("Error decoding users: \(error)")
                completion(error)
            }
            completion(nil)
        }.resume()
    }
    
}


