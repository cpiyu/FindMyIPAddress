//
//  IPView.swift
//  FindMyIP
//
//  Created by Priya Chaurasiya on 05/02/24.
//

import SwiftUI

struct IPView: View {
    @ObservedObject var viewModel: IPViewModel

    var body: some View {
        VStack {
         
            if viewModel.isLoading {
                ProgressView("Fetching Data...")
            } else {
                if let iPAddress = viewModel.iPAddress {
                    Text("Your IP Address: \(iPAddress)")
                } else if let error = viewModel.error {
                    Text("Error: \(error.localizedDescription)")
                }
            }
        }
        .onAppear {
            viewModel.fetchIPAddress()
        }
        
    }
}

struct IpView_preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

