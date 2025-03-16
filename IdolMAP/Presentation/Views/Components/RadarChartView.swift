//
//  RadarChartView.swift
//  IdolMAP
//
//  Created by 김동현 on 3/16/25.
//

import SwiftUI

struct RadarChartView: View {
    let categories: [String]
    let values: [Double]

    @State private var scaleUp = false

    var body: some View {
        ZStack {
            RadarChartGrid(categories: categories)
            RadarChartShape(values: values, categoryCount: categories.count)
                .fill(Color.pink.opacity(0.5))
                .overlay(
                    RadarChartShape(values: values, categoryCount: categories.count)
                        .stroke(Color.white, lineWidth: 2)
                )
                .scaleEffect(scaleUp ? 1.05 : 1.0)
                .onAppear {
                    withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                        scaleUp.toggle()
                    }
                }
            RadarChartLabels(categories: categories)
        }
        .frame(width: 200, height: 200)
    }
}


struct RadarChartShape: Shape {
    let values: [Double]
    let categoryCount: Int

    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let angles = (0..<categoryCount).map { angleIndex in
            Angle(degrees: Double(angleIndex) * (360.0 / Double(categoryCount)))
        }

        var path = Path()
        let firstPoint = CGPoint(
            x: center.x + Foundation.cos(angles[0].radians) * (values[0] / 5.0 * radius),
            y: center.y + Foundation.sin(angles[0].radians) * (values[0] / 5.0 * radius)
        )
        path.move(to: firstPoint)

        for (i, angle) in angles.enumerated() {
            let scaledValue = values[i] / 5.0 * radius
            let point = CGPoint(
                x: center.x + Foundation.cos(angle.radians) * scaledValue,
                y: center.y + Foundation.sin(angle.radians) * scaledValue
            )
            path.addLine(to: point)
        }

        path.addLine(to: firstPoint)
        path.closeSubpath()

        return path
    }
}

struct RadarChartGrid: View {
    let categories: [String]

    var body: some View {
        ZStack {
            ForEach(1..<6, id: \.self) { level in
                RadarChartShape(values: Array(repeating: Double(level), count: categories.count), categoryCount: categories.count)
                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
            }
        }
    }
}

struct RadarChartLabels: View {
    let categories: [String]

    var body: some View {
        GeometryReader { geometry in
            let center = CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2)
            let radius = min(geometry.size.width, geometry.size.height) / 2

            ForEach(0..<categories.count, id: \.self) { i in
                let angle = Angle(degrees: Double(i) * (360.0 / Double(categories.count)))
                let xOffset = Foundation.cos(angle.radians) * radius * 1.15
                let yOffset = Foundation.sin(angle.radians) * radius * 1.15

                Text(categories[i])
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .position(x: center.x + xOffset, y: center.y + yOffset)
            }
        }
    }
}

#Preview {
    RadarChartView(
//        categories: ["귀여움", "예쁨", "춤", "노래", "예능감", "리더십"],
        categories: ["👍 찐덕력", "🔥 칼각 안무력", "🤝 예능 케미 폭발", "👀 아이컨택 마스터", "🎯 팬심 스나이퍼", "🎭 컨셉 장인"],
        values: [4.5, 5.0, 3.0, 4.2, 4.8, 3.5]
    )
    .padding()
    .background(Color.black) // 배경색 추가하여 가시성 증가
}
