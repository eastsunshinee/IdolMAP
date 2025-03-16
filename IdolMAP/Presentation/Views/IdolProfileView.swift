//
//  IdolProfileView.swift
//  IdolMAP
//
//  Created by 김동현 on 3/16/25.
//
import SwiftUI

struct IdolProfileView: View {
    @ObservedObject var viewModel: IdolProfileViewModel

    let categories = ["👍 찐덕력", "🔥 칼각 안무력", "🤝 예능 케미 폭발", "👀 아이컨택 마스터", "🎯 팬심 스나이퍼", "🎭 컨셉 장인"]
    let values: [Double] = [4.5, 5.0, 3.0, 4.2, 4.8, 3.5]

    var body: some View {
        VStack(spacing: 20) {
            if let idol = viewModel.idol {
                // 🔹 아이돌 프로필 정보
                HStack(spacing: 15) {
                    Image(idol.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        .shadow(radius: 5)

                    VStack(alignment: .leading, spacing: 8) {
                        Text(idol.name)
                            .font(.title.bold())
                            .foregroundColor(.white)
                        Text(idol.group)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding()

                // 🔹 레이더 차트 추가
                RadarChartView(categories: categories, values: values)
                    .frame(width: 250, height: 250) // 크기 조정
                    .padding(.vertical, 10)

                // 🔹 태그 리스트 추가
                TagListView(tags: idol.tags)
                    .padding(.bottom, 10)
            }
            Spacer()
        }
        .padding()
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.black, Color.purple.opacity(0.8)]),
                startPoint: .topLeading, endPoint: .bottomTrailing
            )
        )
        .cornerRadius(25)
        .shadow(radius: 8)
        .padding()
    }
}

// ✅ SwiftUI 미리보기 추가
#Preview {
    let repository = MockIdolDataSource()
    let useCase = GetIdolProfileUseCaseImpl(repository: repository)
    let viewModel = IdolProfileViewModel(getIdolProfileUseCase: useCase)

    return IdolProfileView(viewModel: viewModel)
}
