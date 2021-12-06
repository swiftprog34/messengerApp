//
//  User+CoreDataProperties.swift
//  socialMVP
//
//  Created by Виталий Емельянов on 06.11.2021.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var password: String?
    @NSManaged public var image: String?
    @NSManaged public var id: UUID?

}

extension User : Identifiable {

}
