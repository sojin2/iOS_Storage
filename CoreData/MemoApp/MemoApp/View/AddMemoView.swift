//
//  AddMemoView.swift
//  MemoApp
//
//  Created by 김소진 on 12/12/24.
//

import SwiftUI

struct AddMemoView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var memoRepository: MemoRepository

    @State private var title: String = ""
    @State private var content: String = ""

    var body: some View {
        Form {
            TextField("제목", text: $title)
            TextEditor(text: $content)
                .frame(height: 200)
        }
        .navigationTitle("새 메모")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("취소") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("저장") {
                    saveMemo()
                    dismiss()
                }
            }
        }
    }

    private func saveMemo() {
        memoRepository.createMemo(title: title, content: content)
    }
}
