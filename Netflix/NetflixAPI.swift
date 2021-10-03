//
//  NetflixAPI.swift
//  Netflix
//
//  Created by William Tristão de Pauloa on 30/09/21.
//

import Foundation

protocol FeedMovieDelegate {
    func response(status: Int, feedMovie: FeedMovie)
}

class NetflixAPI{
    static let shared = NetflixAPI()
    var delegate: FeedMovieDelegate!
    
    func request() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.delegate.response(status: 200, feedMovie: FeedMovie())
        })
    }
}
