//
//  MockIdolDataSource.swift
//  IdolMAP
//
//  Created by 김동현 on 3/16/25.
//

import Foundation

class MockIdolDataSource: IdolRepository {
    func fetchIdolProfile() -> Idol {
        return Idol(
            name: "김서연",
            imageName: "idol_sample",
            group: "DreamGirls",
            birthdate: "2001.05.14",
            mbti: "INFJ",
            debut: "2020년 7월 10일",
            followers: "1.2M",
            tags: ["청순", "카리스마", "댄스 퀸", "귀여움"]
        )
    }
}
