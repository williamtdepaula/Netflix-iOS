//
//  FeedMovieTableViewCell.swift
//  Netflix
//
//  Created by William Tristão de Pauloa on 01/10/21.
//

import UIKit

class FeedMovieTableViewCell: UITableViewCell {
    
    var movies: [Movie]? {
        didSet {
            collectionMovieView.movies = movies
        }
    }
    
    var type: Bool? {
        didSet {
            collectionMovieView.type = type ?? false
        }
    }
    
    let collectionMovieView: MovieCollectionView = {
        let collectionView = MovieCollectionView()
        
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() -> Void{
        addSubview(collectionMovieView.collectionView)
        
        collectionMovieView.collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "V:|[v0]|",
            options: [],
            metrics: nil,
            views:["v0": collectionMovieView.collectionView]
        ))
        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|[v0]|",
            options: [],
            metrics: nil,
            views:["v0": collectionMovieView.collectionView]
        ))
    }
}

extension UITableViewCell {
    open override func addSubview(_ view: UIView) {
        super.addSubview(view)
        
        sendSubviewToBack(contentView)
    }
}
