//
//  Movie+CoreDataProperties.swift
//  NicksFlicks
//
//  Created by Nick on 1/14/16.
//  Copyright © 2016 Nick. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Movie {

    @NSManaged var image: NSData?
    @NSManaged var imdb: String?
    @NSManaged var movie_description: String?
    @NSManaged var title: String?

}
