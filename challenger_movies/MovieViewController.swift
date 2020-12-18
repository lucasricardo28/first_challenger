//
//  MovieViewController.swift
//  challenger_movies
//
//  Created by Ricardo Martins on 15/12/20.
//

import UIKit

class MovieViewController: UIViewController {
    
    //MARK: vars
    var movies:Array<Movie> = [];
    
    var selectedMovie:Movie = Movie(id: 0, image_background: UIImage(), image_main: UIImage(), title: "", category: "", description: "", isFavority: false)
    
    //MARK: outlets
    @IBOutlet weak var tableViewMovies: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewMovies.delegate = self
        tableViewMovies.dataSource = self
        
        loadingMovies()
    }
    
    func loadingMovies() {
        movies = MovieRepository.getAllMovies()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            destination.movie = selectedMovie
            destination.detailProtocol = self
        }
    }

}

extension MovieViewController: UITableViewDelegate {
    
}

extension MovieViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellMovie") as? MovieTableViewCell else {
            return UITableViewCell()
        }
        
        let index = indexPath.row
        let movie = movies[index]
        
        cell.setMovie(movie)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 136
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedMovie = movies[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.performSegue(withIdentifier:"segueDetailMovie", sender: self)
    }
}

extension MovieViewController: DetailMoviewProtocol {
    func reloadTable() {
        self.tableViewMovies.reloadData()
    }
}
