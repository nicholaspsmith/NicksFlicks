//
//  DetailVC.swift
//  NicksFlicks
//
//  Created by Nick on 1/17/16.
//  Copyright © 2016 Nick. All rights reserved.
//

import UIKit
import CoreData

class DetailVC: UIViewController {
    
    var tableIndex: Int!
    var movies: [Movie]!

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var imdbLink: UILabel!
    @IBOutlet weak var movieDesc: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadPost()
    }
    
    override func viewDidAppear(animated: Bool) {
        loadPost()
    }
    
    func loadPost() {
        self.tableIndex = DataService.instance.key
        
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Movie")
        
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            self.movies = results as! [Movie]
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        img.image = UIImage(data: self.movies[tableIndex].image!)
        movieTitle.text = self.movies[tableIndex].title
        movieDesc.text = self.movies[tableIndex].movie_description
        imdbLink.text = self.movies[tableIndex].imdb
    }

}
