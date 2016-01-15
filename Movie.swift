//
//  Movie.swift
//  NicksFlicks
//
//  Created by Nick on 1/14/16.
//  Copyright © 2016 Nick. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Movie: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    
    func setMovieImage(img: UIImage) {
        let data = UIImageJPEGRepresentation(img, 0.8)
        self.image = data
    }
    
    func getMovieImage() -> UIImage {
        let img = UIImage(data: self.image!)!
        return img
    }

}
