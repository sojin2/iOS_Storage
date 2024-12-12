//
//  MemoListView.swift
//  MemoApp
//
//  Created by 김소진 on 12/12/24.
//

import SwiftUI

struct MemoListView: View {
    @EnvironmentObject var memoRepository: MemoRepository

    var body: some View {
        NavigationStack {
            List {
                ForEach(memoRepository.memos, id: \.self) { memo in
                    NavigationLink(destination: MemoDetailView(memo: memo)) {
                        VStack(alignment: .leading) {
                            Text(memo.title ?? "제목 없음")
                                .font(.headline)
                            Text(memo.content ?? "내용 없음")
                                .font(.subheadline)
                            Text(memo.date ?? Date(), style: .date)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .onDelete { indexSet in
                    indexSet.forEach { index in
                        memoRepository.deleteMemo(memoRepository.memos[index])
                    }
                }
            }
            .navigationTitle("메모 목록")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddMemoView()) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}
