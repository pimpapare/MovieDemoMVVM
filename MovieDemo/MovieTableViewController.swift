//
//  MovieViewController.swift
//  MovieDemoCleanSwift
//
//  Created by pimpaporn chaichompoo on 7/3/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import UIKit
import EZSwiftExtensions

import RxCocoa
import RxSwift

protocol MovieTableViewControllerProtocol {
    
    func onDataDidLoad()
    func onDataDidLoadErrorWithMessage(errorMessage: String)
    func reloadWithData(newData:[Subscribe])
}

class MovieTableViewController: UIViewController, MovieTableViewControllerProtocol {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var querySucess:Bool = false
    var movieViewModel:MovieViewModel!
    let disposeBag = DisposeBag()
    var movieList:[Subscribe] = [Subscribe]()
    
    override func viewDidLoad() {
        
        setupTableView()
        movieViewModel = MovieViewModel(view: self, viewControllerModel: MovieModel())
        movieViewModel.verifyForRemoveRealmObjects(forceRemove: true)
        movieViewModel.getMovieList()
        observeSearchBar()
    }
    
    func observeSearchBar() {
        
        searchBar
            .rx.text
            .orEmpty
            .debounce(0.5, scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .subscribe(onNext: { [unowned self] query in
                
                self.movieViewModel.verifyQueryData(query: query, completionHandler: { (success) in
                    self.querySucess = success
                    self.tableView.reloadData()
                })
            })
            .addDisposableTo(disposeBag)
    }
    
    func onDataDidLoad() {
        self.tableView.reloadData()
    }
    
    func onDataDidLoadErrorWithMessage(errorMessage: String) {
        showAlertPopup(title: "Error", message: errorMessage, yes_text: "OK")
    }
    
    func reloadWithData(newData:[Subscribe]){
        movieList = newData
    }
    
    func emptyView() -> UIView? {
        let nibView = Bundle.main.loadNibNamed("EmptyView", owner: nil, options: nil)!.first as! EmptyView
        return nibView
    }
}

extension MovieTableViewController: UIScrollViewDelegate, EmptyViewDelegate {
    
    func addEmptyView() {
        self.view.addSubview(self.emptyView()!)
    }
    
    func removeEmptyView() {
        self.emptyView()?.removeFromSuperview()
    }
    
    func didReload() {
        self.tableView.reloadData()
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let distance = scrollView.contentSize.height - (targetContentOffset.pointee.y + scrollView.bounds.height)
        movieViewModel.verifyScaleForReloadData(distance: distance, querySucess: querySucess)
    }
}
