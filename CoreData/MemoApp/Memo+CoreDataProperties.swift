//
//  Memo+CoreDataProperties.swift
//  MemoApp
//
//  Created by 김소진 on 12/12/24.
//
//

import Foundation
import CoreData


extension Memo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Memo> {
        return NSFetchRequest<Memo>(entityName: "Memo")
    }

    @NSManaged public var content: String?
    @NSManaged public var date: Date?
    @NSManaged public var title: String?

}

extension Memo : Identifiable {

}
