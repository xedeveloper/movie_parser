//
//  Protocols.swift
//  machine_test
//
//  Created by Shankar's mac mini on 01/05/21.
//

import Foundation

protocol ViewProtocol {
    func didFinishedFetchingResultFromFile(_ result:Result<[Movie],Error>)
}

protocol PresenterProtocol {
    var view:ViewProtocol? {get set}
    var interactor:InteractorInputProtocol? {get set}
    var router :RouterProtocol? {get set}
    func startFetchingDataFromFile()
    func pushToDetailsViewController(_ viewControllerRef:FirstViewController, movie:Movie)
}

protocol InteractorInputProtocol {
    var opPresenter:InteractorOutputProtocol? {get set}
    func startFetchRequest()
    
}
protocol InteractorOutputProtocol {
    func didFinishedFetchingResultFromFromFile(_ result:Result<[Movie],Error>)
}

protocol RouterProtocol {
    static func bindProtocolsToView(_ viewControllerRef:FirstViewController)
    func pushToDetailsController(_ viewControllerRef:FirstViewController, and movie:Movie)
}

