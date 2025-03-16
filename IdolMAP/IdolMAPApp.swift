//
//  IdolMAPApp.swift
//  IdolMAP
//
//  Created by 김동현 on 3/15/25.
//

import SwiftUI

@main
struct IdolMAPApp: App {
//    let persistenceController = PersistenceController.shared

    let repository = MockIdolDataSource()
    let getIdolProfileUseCase: GetIdolProfileUseCase
    let viewModel: IdolProfileViewModel

    init() {
        self.getIdolProfileUseCase = GetIdolProfileUseCaseImpl(repository: repository)
        self.viewModel = IdolProfileViewModel(getIdolProfileUseCase: getIdolProfileUseCase)
    }

    var body: some Scene {
        WindowGroup {
            IdolProfileView(viewModel: viewModel)
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
