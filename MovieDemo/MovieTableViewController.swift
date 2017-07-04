//
//  MovieTableViewController.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 6/5/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import UIKit
import EZSwiftExtensions

import RxCocoa
import RxSwift

class MovieTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    lazy var movieViewModel:MovieViewModel = MovieViewModel(delegate: self)
    let disposeBag = DisposeBag()
    
    var querySucess:Bool = false
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        movieViewModel.getMovieList()
        movieViewModel.verifyForRemoveRealmObjects()
        
        setupTableView()
        observeSearchBar()
    }
    
    func observeSearchBar() {
        
        searchBar
            .rx.text
            .orEmpty
            .debounce(0.5, scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .subscribe(onNext: { [unowned self] query in
                
                self.movieViewModel.queryData(query: query, completionHandler: { (success) in
                    self.querySucess = success
                    self.tableView.reloadData()
                })
                
            })
            .addDisposableTo(disposeBag)
    }
    
    override func onDataDidLoad() {
        didReload()
    }
    
    override func onDataDidLoadErrorWithMessage(errorMessage: String) {
        showAlertPopup(title: "Error", message: errorMessage, yes_text: "OK")
    }
    
    func pullToRefresh() {
        self.movieViewModel = MovieViewModel(delegate: self)
        self.movieViewModel.isPullToRefresh = true
        self.movieViewModel.getMovieList()
    }
    
    func emptyView() -> UIView? {
        let nibView = Bundle.main.loadNibNamed("EmptyView", owner: nil, options: nil)!.first as! EmptyView
        return nibView
    }
}

extension MovieTableViewController: UIScrollViewDelegate, EmptyViewDelegate {
    
    func didReload() {
        
        if movieViewModel.setMovie().count == 0 {
            self.view.addSubview(self.emptyView()!)
        }
        
        self.emptyView()?.removeFromSuperview()
        self.tableView.reloadData()
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let distance = scrollView.contentSize.height - (targetContentOffset.pointee.y + scrollView.bounds.height)
        
        if distance < 150 && querySucess == false{
            self.movieViewModel.getMovieList()
        }
    }
}
