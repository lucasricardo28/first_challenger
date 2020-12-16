//
//  DetailViewController.swift
//  challenger_movies
//
//  Created by Ricardo Martins on 16/12/20.
//

import UIKit

class DetailViewController: ViewController {
    
    var movie:Movie = Movie(image_background: UIImage(), image_main: UIImage(), title: "", category: "", description: "")
    
    //MARK: outlets
    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var imageMain: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mountDetailMovie()
        // Do any additional setup after loading the view.
    }
    
    func mountDetailMovie(){
        imageBackground.image = movie.image_background
        imageMain.image = movie.image_main
        labelTitle.text = movie.title
        labelDescription.text = movie.description
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
