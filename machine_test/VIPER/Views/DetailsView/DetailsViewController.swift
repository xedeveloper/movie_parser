//
//  DetailsViewController.swift
//  machine_test
//
//  Created by Shankar's mac mini on 01/05/21.
//

import UIKit

class DetailsViewController :UIViewController{
    
    public var movie:Movie?
    
    private lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let movie = movie else {return}
        self.title = movie.title
        
        view.backgroundColor = .white
        titleLabel.text = movie.original_title
        setupVew()
    }
    private func setupVew(){
        [titleLabel].forEach{view.addSubview($0)}
        NSLayoutConstraint.activate([
        
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
            titleLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
        ])
        
    }
}
