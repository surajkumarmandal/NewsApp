//
//  NewsFeedViewModel.swift
//  NewsApp
//
//  Created by Suraj Kumar Mandal on 12/06/22.
//

import Foundation

class NewsFeedViewModel {
    
    var delegate : NewsFeedProtocol?
    
    func getNewsFeed() {
        if let delegate = delegate {
            delegate.startLoader()
            // API url
            let url = ApiUrl.API_URL + Constant.API_KEY
            var request = URLRequest(url: URL(string: url)!)
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
                do {
                    guard let value = data else {
                        return
                    }
                    let jsonDecoder = JSONDecoder()
                    let responseModel = try jsonDecoder.decode(NewsFeedModel.self, from: value)
                    print(responseModel)
                    if responseModel.status == "OK" {
                        delegate.loadData(data: responseModel)
                    } else {
                        print("error")
                    }
                } catch {
                    print("JSON Serialization error")
                }
            }).resume()
        }
    }
    
}

protocol NewsFeedProtocol {
    func startLoader()
    func stopLoader()
    func loadData(data: NewsFeedModel?)
}
