//
//  Idol.swift
//  IdolMAP
//
//  Created by 김동현 on 3/16/25.
//

import Foundation

struct Idol: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let group: String
    let birthdate: String
    let mbti: String
    let debut: String
    let followers: String
    let tags: [String]
}
