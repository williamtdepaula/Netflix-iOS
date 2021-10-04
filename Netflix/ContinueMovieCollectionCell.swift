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
            image.image = UIImage(named: movie?.imgURL ?? "")
            title.text = movie?.title
            desc.text = movie?.description
            
            Timer.scheduledTimer(withTimeInterval: 0, repeats: false, block: {time in
                self.progress.setProgress(0.8, animated: true)
            })
        }
    }
    
    let image: UIImageView = {
        let image = UIImageView()
        
        image.contentMode = .scaleAspectFill
        
        image.clipsToBounds = true
        
        return image
    }()
    
    let playButton: UIImageView = {
        let playButton = UIImageView()
        
        playButton.image = UIImage(named: "overlay")
        
        return playButton
    }()
    
    let progress: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .default)
        
        progressView.progressTintColor = .red
        progressView.trackTintColor = UIColor(named: "card")
        progressView.progress = 0
        
        return progressView
    }()
    
    let title: UILabel = {
        let title = UILabel()
        title.textColor = .white
        title.font = UIFont.boldSystemFont(ofSize: 16)
        
        return title
    }()
    
    let desc: UILabel = {
        let desc = UILabel()
        desc.textColor = .white
        desc.font = UIFont.systemFont(ofSize: 14)
        
        return desc
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(image)
        addSubview(playButton)
        addSubview(progress)
        addSubview(title)
        addSubview(desc)
        
        image.translatesAutoresizingMaskIntoConstraints = false
        playButton.translatesAutoresizingMaskIntoConstraints = false
        progress.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        desc.translatesAutoresizingMaskIntoConstraints = false
        
        addConstraints(NSLayoutConstraint.constraints(
                        withVisualFormat:"H:|[image]|",
                        options: [],
                        metrics: nil,
                        views: ["image": image])
        )
        addConstraints(NSLayoutConstraint.constraints(
                        withVisualFormat:"H:|-6-[progress]-6-|",
                        options: [],
                        metrics: nil,
                        views: ["progress": progress])
        )
        addConstraints(NSLayoutConstraint.constraints(
                        withVisualFormat:"H:|-6-[title]-6-|",
                        options: [],
                        metrics: nil,
                        views: ["title": title])
        )
        addConstraints(NSLayoutConstraint.constraints(
                        withVisualFormat:"H:|-6-[desc]-6-|",
                        options: [],
                        metrics: nil,
                        views: ["desc": desc])
        )
        addConstraints(NSLayoutConstraint.constraints(
                        withVisualFormat:"V:[image(\(self.frame.width * (9 / 16)))]-3-[progress]-6-[title]-0-[desc]|",
                        options: [],
                        metrics: nil,
                        views: ["image": image, "progress": progress, "title": title, "desc": desc ])
        )
        
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(
            NSLayoutConstraint(
                item: self,
                attribute: .centerY,
                relatedBy: .equal,
                toItem: playButton,
                attribute: .centerY,
                multiplier: 1,
                constant: (self.frame.height - (self.frame.width * (9 / 16))) / 2
            )
        )
        
        constraints.append(
            NSLayoutConstraint(
                item: self,
                attribute: .centerX,
                relatedBy: .equal,
                toItem: playButton,
                attribute: .centerX,
                multiplier: 1,
                constant: 0
            )
        )
        
        NSLayoutConstraint.activate(constraints)
        
    }
}
