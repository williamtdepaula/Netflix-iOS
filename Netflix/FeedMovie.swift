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
    let hightLight = Movie(id: 1, imgURL: "", title: "Título", description: "Apenas uma descrição")
    
    let movie: [Int: (String, [Movie])] = [
        0: (
            "Continue assistindo",
            [
                Movie(id: 2, imgURL: "", title: "Teste", description: "Apenas uma descrição"),
                Movie(id: 3, imgURL: "", title: "Título", description: "Apenas uma descrição"),
                Movie(id: 4, imgURL: "", title: "Título", description: "Apenas uma descrição")
            ]
        ),
        1: (
            "Recentemente adicionados",
            [
                Movie(id: 2, imgURL: "", title: "Teste", description: "Apenas uma descrição"),
                Movie(id: 3, imgURL: "", title: "Título", description: "Apenas uma descrição"),
                Movie(id: 4, imgURL: "", title: "Título", description: "Apenas uma descrição"),
                Movie(id: 6, imgURL: "", title: "Título", description: "Apenas uma descrição"),
                Movie(id: 7, imgURL: "", title: "Título", description: "Apenas uma descrição"),
                Movie(id: 8, imgURL: "", title: "Título", description: "Apenas uma descrição"),
                Movie(id: 9, imgURL: "", title: "Título", description: "Apenas uma descrição"),
                Movie(id: 10, imgURL: "", title: "Título", description: "Apenas uma descrição"),
                Movie(id: 11, imgURL: "", title: "Título", description: "Apenas uma descrição"),
            ]
        ),
    ]
}
