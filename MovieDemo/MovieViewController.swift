//
//  ViewController.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 6/5/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import UIKit
import IGListKit
import EZSwiftExtensions

class MovieViewController: UIViewController {

    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 0)
    }()
    
    lazy var movieViewModel:MovieViewModel = MovieViewModel(delegate: self)
    
    var collectionView:UICollectionView!
    var sizeForTopOfCollectionView:CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCollectionView()
        self.movieViewModel.getMovieList()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        sizeForTopOfCollectionView = self.movieViewModel.sizeForTopOfCollectionView()
        collectionView.frame = CGRect(x:0,y: sizeForTopOfCollectionView,width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-sizeForTopOfCollectionView)
        
        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        
        flowLayout.invalidateLayout()
    }
    
    override func onDataDidLoad() {
        
        if self.movieViewModel.isPullToRefresh {
            self.movieViewModel.isPullToRefresh = false
            if #available(iOS 10.0, *) {
                self.adapter.collectionView?.refreshControl?.endRefreshing()
            }
        }
        adapter.performUpdates(animated: true, completion: nil)
    }
    
    override func onDataDidLoadErrorWithMessage(errorMessage: String) {
        showAlertPopup(title: "Error", message: errorMessage, yes_text: "OK")
    }
    
    func setCollectionView() {
        
        sizeForTopOfCollectionView = self.movieViewModel.sizeForTopOfCollectionView()

        collectionView = UICollectionView(frame:CGRect(x:0,y: sizeForTopOfCollectionView,width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-sizeForTopOfCollectionView), collectionViewLayout: UICollectionViewFlowLayout())
        collectionView?.backgroundColor = UIColor.white
        view.addSubview(collectionView!)
        
        adapter.collectionView = collectionView
        
        adapter.collectionView?.refreshControl = UIRefreshControl()
        adapter.collectionView?.refreshControl?.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        adapter.dataSource = self
        adapter.scrollViewDelegate = self
    }
    
    func pullToRefresh() {
        self.movieViewModel = MovieViewModel(delegate: self)
        self.movieViewModel.isPullToRefresh = true
        self.movieViewModel.getMovieList()
    }
}

extension MovieViewController: ListAdapterDataSource {
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return self.movieViewModel.movie
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        switch object {
        case is MovieModel:
            return MovieSectionController()
        default:
            return ListSectionController()
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        let nibView = Bundle.main.loadNibNamed("EmptyView", owner: nil, options: nil)!.first as! EmptyView
        return nibView
    }
}

extension MovieViewController: UIScrollViewDelegate, EmptyViewDelegate {
    
    func didReload() {
        adapter.performUpdates(animated: true, completion: nil)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let distance = scrollView.contentSize.height - (targetContentOffset.pointee.y + scrollView.bounds.height)
//        let nextMovieAvailable = (self.movieViewModel.movie as? [MovieModel])?.last?.nextMovieAvailable
        if distance < 200 {
            self.movieViewModel.movie.append(LoadingType.loadmore.rawValue as ListDiffable)
            self.movieViewModel.getMovieList()
            adapter.performUpdates(animated: true, completion: nil)
        }
    }
}
