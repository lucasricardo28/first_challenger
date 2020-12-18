//
//  DetailViewController.swift
//  challenger_movies
//
//  Created by Ricardo Martins on 16/12/20.
//

import UIKit

protocol DetailMoviewProtocol {
    func reloadTable()
}

class DetailViewController: UIViewController {
    
    var movie:Movie? = nil
    var detailProtocol: DetailMoviewProtocol? = nil
    
    //MARK: outlets
    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var imageMain: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var buttonFavorite: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mountDetailMovie()
        buttonFavorite.addTarget(self, action: #selector(setFavorite(_:)), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    func mountDetailMovie(){
        guard let currentMovie = movie else{
            return
        }
        
        imageBackground.image = currentMovie.image_background
        imageMain.image = currentMovie.image_main
        labelTitle.text = currentMovie.title
        labelDescription.text = currentMovie.description
        buttonFavorite.setTitleColor(currentMovie.isFavority ? .red : .lightGray, for: .normal)
    }
    
    @objc func setFavorite(_ sender:UIButton){
        guard let currentMovie = movie else{
            return
        }
        
        detailProtocol?.reloadTable()
        currentMovie.isFavority = !currentMovie.isFavority
        
        sender.setTitleColor(sender.currentTitleColor == .red ? .lightGray : .red, for: .normal)
    }

}
