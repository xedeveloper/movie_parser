//
//  Router.swift
//  machine_test
//
//  Created by Shankar's mac mini on 01/05/21.
//

import UIKit

class Router:RouterProtocol{
    static func bindProtocolsToView(_ viewControllerRef: FirstViewController) {
        let presenter:PresenterProtocol & InteractorOutputProtocol = Presenter()
        viewControllerRef.presenter = presenter
        viewControllerRef.presenter?.router = Router()
        viewControllerRef.presenter?.interactor = Interactor()
        viewControllerRef.presenter?.view = viewControllerRef
        viewControllerRef.presenter?.interactor?.opPresenter = presenter
    }
    
    func pushToDetailsController(_ viewControllerRef: FirstViewController, and movie: Movie) {
        let detailsController = DetailsViewController()
        detailsController.movie = movie
        viewControllerRef.navigationController?.pushViewController(detailsController, animated: true)
    }
    
    
}

