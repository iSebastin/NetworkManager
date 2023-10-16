//
//  ViewMode.swift
//  NetworkManager
//
//  Created by Victor Sebastin on 2023-09-17.
//

import Foundation

class ViewModel: ObservableObject {
    
    enum State {
        case none
        case loading
        case loaded
    }
    
    @Published var articles = [Artwork]()
    @Published var state: State = .none
    
    func fetchAPI() {
        state = .loaded
        let requestData = APIRequestConfig(endPoint: .getArtWorks("cat"), method: .get)
        // Create a response handler
        let responseHandler = DefaultAPIResponseHandler<ArtworkResponseModel>()

        // Make a GET request
        let networkManager = APIManager()
        networkManager.requestData(request: requestData, responseHandler: responseHandler) { [weak self] result in
            switch result {
            case .success(let response):
                print("Success: \(response.data)")
                self?.articles = response.data
                for data in response.data {
                    print(data._score)
                }
                self?.state = .loaded
            case .failure(let error):
                print("Error: \(error)")
                self?.state = .none
            }
        }
    }
}
