//
//  IdolProfileViewModel.swift
//  IdolMAP
//
//  Created by 김동현 on 3/16/25.
//

import Foundation

class IdolProfileViewModel: ObservableObject {
    private let getIdolProfileUseCase: GetIdolProfileUseCase
    @Published var idol: Idol?

    init(getIdolProfileUseCase: GetIdolProfileUseCase) {
        self.getIdolProfileUseCase = getIdolProfileUseCase
        fetchIdolProfile()
    }

    func fetchIdolProfile() {
        idol = getIdolProfileUseCase.execute()
    }
}
