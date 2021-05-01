//
//  FirstViewController.swift
//  machine_test
//
//  Created by Shankar's mac mini on 01/05/21.
//

import UIKit

class FirstViewController: UIViewController {

    var presenter:PresenterProtocol?
    
    private lazy var moviesList:UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var movies:[Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        Router.bindProtocolsToView(self)
        presenter?.startFetchingDataFromFile()
        setupView()
        
        moviesList.register(MovieCell.self, forCellReuseIdentifier: "cell")
        moviesList.delegate = self
        moviesList.dataSource = self
    }
    
    private func setupView(){
        [moviesList].forEach{view.addSubview($0)}
        
        NSLayoutConstraint.activate([
            moviesList.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            moviesList.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            moviesList.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            moviesList.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension FirstViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieCell
        cell.movie = movies[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.pushToDetailsViewController(self, movie: movies[indexPath.row])
    }
}

extension FirstViewController:ViewProtocol{
    func didFinishedFetchingResultFromFile(_ result: Result<[Movie], Error>) {
        DispatchQueue.main.async {
            switch result {
            case .success(let movie):
                self.movies = movie
                self.moviesList.reloadData()
                break
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                break
            }
        }
    }
}
