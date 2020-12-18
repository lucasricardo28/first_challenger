//
//  Movie.swift
//  challenger_movies
//
//  Created by Ricardo Martins on 15/12/20.
//

import Foundation
import UIKit

class Movie {
    var id:Int
    var image_background:UIImage
    var image_main:UIImage
    var title:String
    var category:String
    var description:String
    var isFavority:Bool
    
    init(id:Int, image_background: UIImage, image_main: UIImage, title:String, category: String, description:String, isFavority: Bool) {
        self.id = id
        self.image_background = image_background
        self.image_main = image_main
        self.title = title
        self.category = category
        self.description = description
        self.isFavority = isFavority
    }
}
