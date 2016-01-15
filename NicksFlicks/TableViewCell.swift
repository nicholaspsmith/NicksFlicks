//
//  TableViewCell.swift
//  NicksFlicks
//
//  Created by Nick on 1/14/16.
//  Copyright © 2016 Nick. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var imdb: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(movie: Movie) {
        title.text = movie.title
        desc.text = movie.movie_description
        imdb.text = movie.imdb
        img.image = movie.getMovieImage()
    }

}
