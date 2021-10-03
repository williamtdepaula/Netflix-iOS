//
//  ContinueMovieCollectionCell.swift
//  Netflix
//
//  Created by William Tristão de Pauloa on 01/10/21.
//

import UIKit

class ContinueMovieCollectionCell: UICollectionViewCell{
    var movie: Movie? {
        didSet {
            title.text = movie?.title
            desc.text = movie?.description
        }
    }
    
    let title: UILabel = {
        let title = UILabel()
        
        return title
    }()
    
    let desc: UILabel = {
        let title = UILabel()
        
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(title)
        addSubview(desc)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        desc.translatesAutoresizingMaskIntoConstraints = false
        addConstraints(NSLayoutConstraint.constraints(
                        withVisualFormat:"H:|[title]|",
                        options: [],
                        metrics: nil,
                        views: ["title": title])
        )
        addConstraints(NSLayoutConstraint.constraints(
                        withVisualFormat:"H:|[desc]|",
                        options: [],
                        metrics: nil,
                        views: ["desc": desc])
        )
        addConstraints(NSLayoutConstraint.constraints(
                        withVisualFormat:"V:[title(40)]-0-[desc(40)]|",
                        options: [],
                        metrics: nil,
                        views: ["title": title, "desc": desc ])
        )
    }
}
