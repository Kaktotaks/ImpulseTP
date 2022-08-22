//
//  Screen+CoreDataProperties.swift
//  ImpulseTestProject
//
//  Created by Леонід Шевченко on 22.08.2022.
//
//

import Foundation
import CoreData


extension Screen {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Screen> {
        return NSFetchRequest<Screen>(entityName: "Screen")
    }

    @NSManaged public var watched: Int16

}

extension Screen : Identifiable {

}
