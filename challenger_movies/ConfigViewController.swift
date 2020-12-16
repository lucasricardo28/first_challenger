//
//  ConfigViewController.swift
//  challenger_movies
//
//  Created by Ricardo Martins on 16/12/20.
//

import UIKit

class ConfigViewController: UIViewController {
    
    var suggestedMovies:Array<Movie> = []
    
    @IBOutlet weak var collectionViewMovies: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewMovies.delegate = self
        collectionViewMovies.dataSource = self
        
        loadingMovies()
    }
    
    func loadingMovies() {
        suggestedMovies = MovieRepository.getSugestionMovies()
        
        collectionViewMovies.reloadData()
    }

}

extension ConfigViewController: UICollectionViewDelegate {
    
}

extension ConfigViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return suggestedMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCellMoviePrimary", for: indexPath) as? MovieCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let movie = suggestedMovies[indexPath.row]
        cell.mountCollectionMoview(movie)
        
        return cell
    }
    
}

extension ConfigViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 133, height: 185)
    }
}

