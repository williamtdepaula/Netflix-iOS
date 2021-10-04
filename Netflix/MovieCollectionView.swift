//
//  MovieCollectionView.swift
//  Netflix
//
//  Created by William Tristão de Pauloa on 01/10/21.
//

import UIKit

class MovieCollectionView: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    let collectionContinueMovieId = "collectionContinueMovieId"
    let collectionMovieId = "collectionMovieId"
    
    var type: Bool = false
    
    var movies: [Movie]?
    
    override init() {
        super.init()
        
        collectionView.register(ContinueMovieCollectionCell.self, forCellWithReuseIdentifier: collectionContinueMovieId)
        collectionView.register(MovieCollectionCell.self, forCellWithReuseIdentifier: collectionMovieId)
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
        
        let cl = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        
        cl.showsHorizontalScrollIndicator = false
        
        cl.backgroundColor = UIColor(named: "background")
        
        cl.delegate = self
        cl.dataSource = self
        
        return cl
    }()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let totalMovies = movies?.count else { return 0 }
        
        return totalMovies
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if type{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionContinueMovieId, for: indexPath) as! ContinueMovieCollectionCell
            
            cell.movie = movies?[indexPath.row]
            cell.backgroundColor = UIColor(named: "card")
            
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionMovieId, for: indexPath) as! MovieCollectionCell
        
        cell.movie = movies?[indexPath.row]
        cell.backgroundColor = UIColor(named: "card")
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if type {
            let width: CGFloat = collectionView.frame.width * 0.6
            
            return CGSize(width: width, height: width * (3/4))
        }
        
        let width: CGFloat = collectionView.frame.width * 0.29
        
        return CGSize(width: width, height: width * (16/9))
    }
    
}
