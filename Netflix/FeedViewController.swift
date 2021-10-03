//
//  ViewController.swift
//  Netflix
//
//  Created by William Tristão de Pauloa on 30/09/21.
//

import UIKit

class FeedViewController: UITableViewController {
    
    let cellId = "cell"
    
    var feedMovie: FeedMovie?
    
    let progressView: UIActivityIndicatorView = {
        let loadingIndicatior = UIActivityIndicatorView(style: .large)
        
        loadingIndicatior.color = .lightGray
        
        loadingIndicatior.translatesAutoresizingMaskIntoConstraints = false
        
        loadingIndicatior.startAnimating()
        
        loadingIndicatior.backgroundColor = .black
        
        return loadingIndicatior
    }()
    
    override init(style: UITableView.Style) {
        super.init(style: style)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationController?.navigationBar.barTintColor = .red
        
        setupLoadingIndicator()
        setupConfigTableview()
        
        let api = NetflixAPI.shared
        
        api.delegate = self
        
        api.request()
    }
    
    private func setupConfigTableview() -> Void {
        tableView.register(FeedMovieTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        tableView.backgroundColor = UIColor(named: "background")
        tableView.separatorStyle = .none
    }
    
    func setupLoadingIndicator() -> Void{
        guard let window = UIApplication.shared.windows.first(where: {$0.isKeyWindow}) else {return}
        
        window.addSubview(progressView)
        window.bringSubviewToFront(progressView)
        
        window.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[progress0]|", options: [], metrics: nil, views: ["progress0":progressView]))
        window.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[progress0]|", options: [], metrics: nil, views: ["progress0": progressView]))
        
    }
}

extension FeedViewController: FeedMovieDelegate {
    func response(status: Int, feedMovie: FeedMovie) {
        progressView.removeFromSuperview()
        if status == 200 {
            self.feedMovie = feedMovie
            
            tableView.reloadData()
        }
    }
}

extension FeedViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return feedMovie?.movie.keys.count ?? 0
    }
        
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let movie = feedMovie?.movie else {return nil}
        
        let contaier = UIView()
        let titleHeader = UILabel()
        
        contaier.addSubview(titleHeader)
        
        titleHeader.text = movie[section]?.0
        titleHeader.textColor = .white
        titleHeader.font = UIFont.boldSystemFont(ofSize: 22)
        
        titleHeader.translatesAutoresizingMaskIntoConstraints = false
        
        contaier.addConstraints(NSLayoutConstraint.constraints(
                                withVisualFormat: "H:|-8-[title]|",
                                options: [],
                                metrics: nil,
                                views: ["title": titleHeader]
        ))
        
        return contaier
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let width: CGFloat = tableView.frame.width * 0.6
        
        return width * (3/4)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! FeedMovieTableViewCell
        
        if let movies = feedMovie?.movie {
            
            let movie = movies[indexPath.section]?.1
            
            cell.movies = movie
            
        }
        
        cell.type = indexPath.section == 0
        
        cell.backgroundColor = .brown
        
        return cell
    }
}
