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

protocol PlaceCollectionViewControllerProtocol {
    
    func onDataDidLoad()
    func onDataDidLoadErrorWithMessage(errorMessage: String)
    func reloadWithData(newData:[SubscribePlace])
}

class PlaceCollectionViewController: UIViewController, PlaceCollectionViewControllerProtocol {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var querySucess:Bool = false
    var placeViewModel:PlaceViewModel!
    let disposeBag = DisposeBag()
    var placeList:[SubscribePlace] = [SubscribePlace]()
    
    override func viewDidLoad() {
        
        setupCollectionView()
        placeViewModel = PlaceViewModel(view: self, viewControllerModel: PlaceModel())
        placeViewModel.verifyForRemoveRealmObjects(forceRemove: true)
        placeViewModel.getPlaceList()
    }

    @IBAction func goBackToTableView(_ sender: Any) {
        performSegue(withIdentifier: .unwindToTableViewWithSegue, sender: self)
    }
    
    func onDataDidLoad() {
        self.collectionView.reloadData()
    }
    
    func onDataDidLoadErrorWithMessage(errorMessage: String) {
        showAlertPopup(title: "Error", message: errorMessage, yes_text: "OK")
    }
    
    func reloadWithData(newData:[SubscribePlace]){
        placeList = newData
    }
    
    func emptyView() -> UIView? {
        let nibView = Bundle.main.loadNibNamed("EmptyView", owner: nil, options: nil)!.first as! EmptyView
        return nibView
    }
}

extension PlaceCollectionViewController: UIScrollViewDelegate, EmptyViewDelegate {
    
    func addEmptyView() {
        self.view.addSubview(self.emptyView()!)
    }
    
    func removeEmptyView() {
        self.emptyView()?.removeFromSuperview()
    }
    
    func didReload() {
        self.collectionView.reloadData()
    }
}
