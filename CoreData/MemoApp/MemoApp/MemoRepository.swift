//
//  MemoRepository.swift
//  MemoApp
//
//  Created by 김소진 on 12/12/24.
//

import CoreData
import Combine

class MemoRepository: ObservableObject {
    @Published var memos: [Memo] = []

    private let context = CoreDataStack.shared.context

    init() {
        loadMemos()
    }

    func createMemo(title: String, content: String) {
        let newMemo = Memo(context: context)
        newMemo.title = title
        newMemo.content = content
        newMemo.date = Date()
        saveContext()
        loadMemos()
    }

    func deleteMemo(_ memo: Memo) {
        context.delete(memo)
        saveContext()
        loadMemos()
    }

    func loadMemos() {
        let fetchRequest: NSFetchRequest<Memo> = Memo.fetchRequest()
        do {
            memos = try context.fetch(fetchRequest)
        } catch {
            print("메모 불러오기 실패: \(error)")
        }
    }

    func saveContext() {
        do {
            try context.save()
        } catch {
            print("저장 실패: \(error)")
        }
    }
}
