//
//  GetIdolProfileUseCase.swift
//  IdolMAP
//
//  Created by 김동현 on 3/16/25.
//

import Foundation

protocol GetIdolProfileUseCase {
    func execute() -> Idol
}

class GetIdolProfileUseCaseImpl: GetIdolProfileUseCase {
    private let repository: IdolRepository

    init(repository: IdolRepository) {
        self.repository = repository
    }

    func execute() -> Idol {
        return repository.fetchIdolProfile()
    }
}
