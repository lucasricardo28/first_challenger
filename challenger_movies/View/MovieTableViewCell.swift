//
//  MovieTableViewCell.swift
//  challenger_movies
//
//  Created by Ricardo Martins on 15/12/20.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var imageMain: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setMovie(_ movie:Movie)
    {
        imageMain.image = movie.image_main
        labelTitle.text = movie.title
        labelDescription.text = movie.description
    }

}
