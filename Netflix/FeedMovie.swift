//
//  FeedMovie.swift
//  Netflix
//
//  Created by William Tristão de Pauloa on 01/10/21.
//

import Foundation


struct Movie {
    var id: Int
    var imgURL: String
    var title: String?
    var description: String?
}

class FeedMovie {
    let hightLight = Movie(id: 1, imgURL: "highlight", title: "Título", description: "Apenas uma descrição")
    
    let movie: [Int: (String, [Movie])] = [
        0: (
            "Continue assistindo",
            [
                Movie(id: 2, imgURL: "starwars", title: "Teste", description: "Apenas uma descrição"),
                Movie(id: 4, imgURL: "enola", title: "Título", description: "Apenas uma descrição"),
                Movie(id: 3, imgURL: "highlight", title: "Título", description: "Apenas uma descrição"),
            ]
        ),
        1: (
            "Recentemente adicionados",
            [
                Movie(id: 2, imgURL: "esquadrao", title: "Teste", description: "Apenas uma descrição"),
                Movie(id: 3, imgURL: "sonic", title: "Título", description: "Apenas uma descrição"),
                Movie(id: 4, imgURL: "jumanji", title: "Título", description: "Apenas uma descrição"),
                Movie(id: 6, imgURL: "liga", title: "Título", description: "Apenas uma descrição"),
            ]
        ),
        2: (
            "Em alta",
            [
                Movie(id: 2, imgURL: "esquadrao", title: "Teste", description: "Apenas uma descrição"),
                Movie(id: 3, imgURL: "sonic", title: "Título", description: "Apenas uma descrição"),
                Movie(id: 4, imgURL: "jumanji", title: "Título", description: "Apenas uma descrição"),
                Movie(id: 6, imgURL: "liga", title: "Título", description: "Apenas uma descrição"),
            ]
        ),
    ]
}
