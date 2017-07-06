//
//  CollectionView.swift
//  MovieDemo
//
//  Created by pimpaporn chaichompoo on 7/4/17.
//  Copyright © 2017 Pimpaporn Chaichompoo. All rights reserved.
//

import UIKit

//extension MovieCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
//    @available(iOS 6.0, *)
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//
//    func setupCollectionView() {
//        
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
//        collectionView.register(UINib(nibName:MovieCollectionViewCell.identifier,bundle:nil), forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return MovieViewModel.getCollectionCellSize()
//    }
//    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsetsMake (10,10,10,10)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return movieViewModel.getMovie().count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell else {
//            fatalError("Wrong Cell")
//        }
//        cell.setCell(objects:movieViewModel.movieModel.shownMovie[indexPath.row])
//        return cell
//    }
//}
