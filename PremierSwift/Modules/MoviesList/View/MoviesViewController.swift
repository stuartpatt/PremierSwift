import UIKit

class MoviesViewController: UITableViewController {
    
    private var movies: [Movie] = []
    private var presenter: MovieListPresenter!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        configureView()
        
        presenter.viewDidLoad()
        
    }
    
    func configureWith(presenter: MovieListPresenter) {
        
        self.presenter = presenter
        
    }
    
    private func configureView() {
        
        title = "Top Movies"
        
        let nib = UINib(nibName: "MovieTableViewCell", bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: "CellIdentifier")
        
        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.estimatedRowHeight = 455
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movies.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let movie = movies[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath) as! MovieTableViewCell
        
        cell.configureWith(movie: movie)
        
        return cell
        
    }
        
}

extension MoviesViewController: MovieListView {
    
    func showMovieList(_ movies: [Movie]) {
    
        self.movies = movies
        
        self.tableView.reloadData()
        
    }
    
    func showFetchError(_ error: Error) {
        
        let alertView = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alertView.addAction(okAction)
        
        present(alertView, animated: true)
        
    }
    
}
