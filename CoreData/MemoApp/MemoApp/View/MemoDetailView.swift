//
//  EditMemoView.swift
//  MemoApp
//
//  Created by 김소진 on 12/12/24.
//

import SwiftUI

struct MemoDetailView: View {
    let memo: Memo

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(memo.title ?? "제목 없음")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text(memo.content ?? "내용 없음")
                .font(.body)
                .padding(.top, 10)

            Spacer()

            Text(memo.date ?? Date(), style: .date)
                .font(.footnote)
                .foregroundColor(.gray)
                .padding(.top, 20)
        }
        .padding()
        .navigationTitle("메모 보기")
        .navigationBarTitleDisplayMode(.inline)
    }
}
