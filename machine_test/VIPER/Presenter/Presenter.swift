//
//  Presenter.swift
//  machine_test
//
//  Created by Shankar's mac mini on 01/05/21.
//

import Foundation

class Presenter:PresenterProtocol{
    var view: ViewProtocol?
    var interactor: InteractorInputProtocol?
    var router: RouterProtocol?
    
    func startFetchingDataFromFile() {
        interactor?.startFetchRequest()
    }
    
    func pushToDetailsViewController(_ viewControllerRef: FirstViewController, movie: Movie) {
        router?.pushToDetailsController(viewControllerRef, and: movie)
    }
    
}

extension Presenter:InteractorOutputProtocol{
    func didFinishedFetchingResultFromFromFile(_ result: Result<[Movie], Error>) {
        view?.didFinishedFetchingResultFromFile(result)
    }
}
