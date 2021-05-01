//
//  MovieCell.swift
//  machine_test
//
//  Created by Shankar's mac mini on 01/05/21.
//

import UIKit

class MovieCell:UITableViewCell{
    
    private lazy var thumbnail:UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var title:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var movie:Movie?{
        didSet{
            setupView()
        }
    }
    
    private func setupView(){
        guard let movie = movie else {return}
        
        [thumbnail,title].forEach{addSubview($0)}
        backgroundColor = .white
        
        NSLayoutConstraint.activate([
            thumbnail.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            thumbnail.topAnchor.constraint(equalTo: topAnchor  ,constant: 5),
            thumbnail.widthAnchor.constraint(equalTo: heightAnchor),
            thumbnail.heightAnchor.constraint(equalToConstant: 50),
            
            title.leadingAnchor.constraint(equalTo: thumbnail.trailingAnchor,constant: 5),
            title.topAnchor.constraint(equalTo: thumbnail.topAnchor),
            title.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
            title.bottomAnchor.constraint(equalTo: thumbnail.bottomAnchor)
        ])
        title.text = movie.title
        loadImage(movie)
    }
    
    private func loadImage(_ movie:Movie){
        guard let baseURL = URL(string:"https://image.tmdb.org/t/p/w92") else {return}
        let imgURL = baseURL.appendingPathComponent(movie.poster_path)
        
        URLSession.shared.dataTask(with: imgURL) { (data, response, err) in
            if let error = err {
                print("Error Fetching Poster: \(error.localizedDescription)")
            }
            if let data = data{
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self.thumbnail.image = image
                }
                
            }
        }.resume()
    }
}
