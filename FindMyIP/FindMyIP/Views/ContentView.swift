//
//  ContentView.swift
//  FindMyIP
//
//  Created by Priya Chaurasiya on 05/02/24.
//

import SwiftUI
import FindMyIPFramework

struct ContentView: View {
    
    init(){
        print("priya",FindMyIP.self)
    }
    var body: some View {
        IPView(viewModel: IPViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

