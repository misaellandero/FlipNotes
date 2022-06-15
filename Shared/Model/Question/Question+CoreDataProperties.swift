//
//  Question+CoreDataProperties.swift
//  FlipNotes
//
//  Created by Misael Landero on 14/06/22.
//
//

import Foundation
import CoreData


extension Question {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Question> {
        return NSFetchRequest<Question>(entityName: "Question")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var question: String?
    @NSManaged public var answer: String?
    @NSManaged public var moreInfo: String?
    @NSManaged public var categories: Categories?
    @NSManaged public var tags: NSSet?
    @NSManaged public var completed: Bool
    
    // MARK: - Wrapped vars
    
    public var wrappedId : UUID {
        id ?? UUID()
    }
    
    public var wrappedQuestion : String {
        question ?? ""
    }
    
    public var wrappedAnswer : String {
        answer ?? ""
    }
     
    public var wrappedMoreInfo : String {
        moreInfo ?? ""
    }
    
    public var wrappedCategory : String {
        categories?.wrappedName ?? "No category"
    }
    
    // MARK: - Relationships Array
    
    public var tagsArray: [Tags] {
        let set = tags as? Set<Tags> ?? []
        
        return set.sorted {
            $0.wrappedName > $1.wrappedName
        }
    }
     
}

// MARK: Generated accessors for tags
extension Question {

    @objc(addTagsObject:)
    @NSManaged public func addToTags(_ value: Tags)

    @objc(removeTagsObject:)
    @NSManaged public func removeFromTags(_ value: Tags)

    @objc(addTags:)
    @NSManaged public func addToTags(_ values: NSSet)

    @objc(removeTags:)
    @NSManaged public func removeFromTags(_ values: NSSet)

}

extension Question : Identifiable {

}
