//
//  MovieCollectionViewCell.swift
//  challenger_movies
//
//  Created by Ricardo Martins on 16/12/20.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageMain: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    
    func mountCollectionMoview(_ movie:Movie){
        imageMain.image = movie.image_main
        labelTitle.text = movie.title
    }
}
