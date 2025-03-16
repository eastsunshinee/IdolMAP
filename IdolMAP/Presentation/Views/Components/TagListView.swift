//
//  TagListView.swift
//  IdolMAP
//
//  Created by 김동현 on 3/16/25.
//

import SwiftUI

struct TagListView: View {
    let tags: [String]
    
    @State private var isAnimating = false
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(tags, id: \.self) { tag in
                    Text("#\(tag)")
                        .font(.footnote.bold())
                        .padding(.horizontal, 8)
                        .padding(.vertical, 5)
                        .background(Color.purple.opacity(0.2))
                        .cornerRadius(12)
                        .foregroundColor(.white)
                        .scaleEffect(isAnimating ? 1.0 : 0.8)
                        .onAppear {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.3).repeatForever(autoreverses: true)) {
                                isAnimating.toggle()
                            }
                        }
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    TagListView(tags: ["청순", "카리스마", "댄스 퀸", "귀여움", "보컬 리더"])
        .padding()
        .background(Color.black) // 배경 추가하여 가독성 향상
}
