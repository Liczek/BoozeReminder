//
//  Beer+CoreDataProperties.swift
//  BoozeReminder
//
//  Created by Paweł Liczmański on 01.06.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Beer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Beer> {
        return NSFetchRequest<Beer>(entityName: "Beer");
    }

    @NSManaged public var name: String?
    @NSManaged public var logo: String?

}
