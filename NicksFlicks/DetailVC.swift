//
//  DetailVC.swift
//  NicksFlicks
//
//  Created by Nick on 1/17/16.
//  Copyright © 2016 Nick. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var imdbLink: UILabel!
    @IBOutlet weak var movieDesc: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}
