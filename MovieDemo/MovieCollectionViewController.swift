//
//  MovieCollectionViewController.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 7/4/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import UIKit
import EZSwiftExtensions

import RxCocoa
import RxSwift

class MovieCollectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
//    var querySucess:Bool = false
//    var movieViewModel:MovieViewModel!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        movieViewModel = MovieViewModel(view: self, viewControllerModel: MovieModel())
//        movieViewModel.verifyForRemoveRealmObjects(forceRemove: true)
//        movieViewModel.getMovieList()
//        
//        setupCollectionView()
//    }
//
//    override func onDataDidLoad() {
//        didReload()
//    }
//    
//    override func onDataDidLoadErrorWithMessage(errorMessage: String) {
//        showAlertPopup(title: "Error", message: errorMessage, yes_text: "OK")
//    }
//    
//    func pullToRefresh() {
//        self.movieViewModel.getMovieList()
//    }
//    
//    func emptyView() -> UIView? {
//        let nibView = Bundle.main.loadNibNamed("EmptyView", owner: nil, options: nil)!.first as! EmptyView
//        return nibView
//    }
}

//extension MovieCollectionViewController: UIScrollViewDelegate, EmptyViewDelegate {
//
//    func didReload() {
//        
//        if movieViewModel.getMovie().count == 0 {
//            self.view.addSubview(self.emptyView()!)
//        }
//        
//        self.emptyView()?.removeFromSuperview()
//        self.collectionView.reloadData()
//    }
//    
//    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        let distance = scrollView.contentSize.height - (targetContentOffset.pointee.y + scrollView.bounds.height)
//        
//        if distance < 150 && querySucess == false{
//            self.movieViewModel.getMovieList()
//        }
//    }
//}
