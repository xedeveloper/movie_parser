//
//  Movie.swift
//  machine_test
//
//  Created by Shankar's mac mini on 01/05/21.
//

import Foundation

struct Movie:Decodable{
    let id:Int
    let original_title:String
    let poster_path:String
    let title:String
    let vote_average:Double
}
