//
//  MovieTableViewCell.swift
//  challenger_movies
//
//  Created by Ricardo Martins on 15/12/20.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    //MARK: vars
    var currentMoview:Movie? = nil
    
    //MARK: outlets
    @IBOutlet weak var imageMain: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var buttonFavoriteOutlet: UIButton!
    @IBAction func buttonFavorite(_ sender: UIButton) {
        guard let movie = currentMoview else {
            return
        }
        
        movie.isFavority = !movie.isFavority
        sender.setTitleColor(sender.currentTitleColor == .red ? .lightGray : .red, for: .normal)
    }
    
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
        currentMoview = movie
        
        imageMain.image = movie.image_main
        labelTitle.text = movie.title
        labelDescription.text = movie.description
        
        buttonFavoriteOutlet.setTitleColor(movie.isFavority ? .red : .lightGray, for: .normal) 
    }

}
