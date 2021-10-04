//
//  ContinueMovieCollectionCell.swift
//  Netflix
//
//  Created by William Tristão de Pauloa on 02/10/21.
//

import UIKit

class MovieCollectionCell: UICollectionViewCell{
    var movie: Movie? {
        didSet {
            img.image = UIImage(named: movie?.imgURL ?? "")
        }
    }
    
    var img: UIImageView = {
        let image = UIImageView()
        
        image.contentMode = .scaleAspectFill
        
        image.clipsToBounds = true
        
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(img)
        
        img.translatesAutoresizingMaskIntoConstraints = false
        
        addConstraints(NSLayoutConstraint.constraints(
                        withVisualFormat:"H:|[img]|",
                        options: [],
                        metrics: nil,
                        views: ["img": img])
        )
        addConstraints(NSLayoutConstraint.constraints(
                        withVisualFormat:"V:|[img]|",
                        options: [],
                        metrics: nil,
                        views: ["img": img])
        )
    }
}
