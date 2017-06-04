//
//  Booze+CoreDataProperties.swift
//  BoozeReminder
//
//  Created by Paweł Liczmański on 04.06.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import Foundation
import CoreData


extension Booze {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Booze> {
        return NSFetchRequest<Booze>(entityName: "Booze");
    }

    @NSManaged public var boozeName: String?

}
