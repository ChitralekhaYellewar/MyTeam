//
//  TeamMember+CoreDataProperties.swift
//  
//
//  Created by Chitralekha Yellewar on 26/02/20.
//
//

import Foundation
import CoreData


extension TeamMember {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TeamMember> {
        return NSFetchRequest<TeamMember>(entityName: "TeamMember")
    }

    @NSManaged public var name: String?
    @NSManaged public var salary: String?
    @NSManaged public var age: String?
    @NSManaged public var image: String?

}
