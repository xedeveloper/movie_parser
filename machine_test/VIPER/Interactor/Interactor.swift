//
//  Interactor.swift
//  machine_test
//
//  Created by Shankar's mac mini on 01/05/21.
//

import Foundation

class Interactor:InteractorInputProtocol{
    var opPresenter: InteractorOutputProtocol?
    
    func startFetchRequest() {
        guard let fileURL = Bundle.main.url(forResource: "movies", withExtension: "json") else {return}
        var fileData:Data?
        do{
            fileData = try Data(contentsOf: fileURL)
        }catch let fileError{
            opPresenter?.didFinishedFetchingResultFromFromFile(.failure(fileError))
        }
        if let fileData = fileData{
            guard let movies = try? JSONDecoder().decode([Movie].self, from: fileData) else {return}
            opPresenter?.didFinishedFetchingResultFromFromFile(.success(movies))
        }
    
        
    }
}
