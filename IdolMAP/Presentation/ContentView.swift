//
//  ContentView.swift
//  IdolMAP
//
//  Created by 김동현 on 3/15/25.
//

import SwiftUI
import Foundation
import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: IdolProfileViewModel

    var body: some View {
        IdolProfileView(viewModel: viewModel)
    }
}

#Preview {
    let repository = MockIdolDataSource()
    let useCase = GetIdolProfileUseCaseImpl(repository: repository)
    let viewModel = IdolProfileViewModel(getIdolProfileUseCase: useCase)

    return ContentView(viewModel: viewModel)
}
