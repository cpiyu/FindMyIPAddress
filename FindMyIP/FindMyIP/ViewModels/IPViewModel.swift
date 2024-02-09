//
//  IPViewModel.swift
//  FindMyIP
//
//  Created by Priya Chaurasiya on 05/02/24.
//

import Foundation
import Combine
import Alamofire

class IPViewModel: ObservableObject {
    @Published var items: [IPModel] = []
    @Published var region: String?
    @Published var iPAddress: String?
    @Published var isLoading = false
    @Published var error: Error?

    private var cancellables: Set<AnyCancellable> = []

    func fetchIPAddress() {
        isLoading = true

        AF.request("https://ipapi.co/json/")
            .validate()
            .publishDecodable(type: IPModel.self)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.error = error
                }
                self.isLoading = false
            } receiveValue: { model in
                print(model.result)
                self.region = model.value?.region
                self.iPAddress = model.value?.ip
                //self.ipAddress = model.ipAddress
            }
            .store(in: &cancellables)
    }
}
