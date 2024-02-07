//
//  Network_Layer_ExampleApp.swift
//  Network Layer Example
//
//  Created by Gianluca Orpello on 07/02/24.
//

import SwiftUI

@main
struct Network_Layer_ExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ProductsView(viewModel: ProductViewModel(apiService: APIClient()))
        }
    }
}
