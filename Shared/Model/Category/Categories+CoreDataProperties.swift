//
//  Categories+CoreDataProperties.swift
//  FlipNotes
//
//  Created by Misael Landero on 14/06/22.
//
//

import Foundation
import CoreData


extension Categories {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Categories> {
        return NSFetchRequest<Categories>(entityName: "Categories")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var details: String?
    @NSManaged public var color: Int16
    @NSManaged public var questions: NSSet?
    
    // MARK: - Wrapped vars
    
    public var wrappedId : UUID {
        id ?? UUID()
    }
    
    public var wrappedName : String {
        name ?? ""
    }
    
    public var wrappedDetails : String {
        details ?? ""
    }
    
    // MARK: - Relationships Array
    
    public var questionsArray: [Question] {
        let set = questions as? Set<Question> ?? []
        
        return set.sorted {
            $0.wrappedQuestion > $1.wrappedQuestion
        }
    }
    
}

// MARK: Generated accessors for questions
extension Categories {

    @objc(addQuestionsObject:)
    @NSManaged public func addToQuestions(_ value: Question)

    @objc(removeQuestionsObject:)
    @NSManaged public func removeFromQuestions(_ value: Question)

    @objc(addQuestions:)
    @NSManaged public func addToQuestions(_ values: NSSet)

    @objc(removeQuestions:)
    @NSManaged public func removeFromQuestions(_ values: NSSet)

}

extension Categories : Identifiable {

}
