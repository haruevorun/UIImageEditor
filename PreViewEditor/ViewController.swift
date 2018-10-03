//
//  ViewController.swift
//  PreViewEditor
//
//  Created by haruta yamada on 2018/10/02.
//  Copyright © 2018 terany. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    fileprivate let images: [UIImage] = {
        return [#imageLiteral(resourceName: "画像2.png"), #imageLiteral(resourceName: "画像3.png"), #imageLiteral(resourceName: "画像4.png"), #imageLiteral(resourceName: "画像5.png")]
    }()
    fileprivate let scrollView: UIScrollView = {
        return UIScrollView(frame: .zero)
    }()
    fileprivate let collectionView: UICollectionView = {
        var leyout:UICollectionViewLayout = UICollectionViewLayout()
        return UICollectionView(frame: .zero, collectionViewLayout: leyout)
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(collectionView)
        self.view.addSubview(scrollView)
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidLayoutSubviews() {
        scrollView.frame = CGRect(origin: .zero, size: CGSize (width: self.view.frame.width / 2, height: self.view.frame.height / 2))
        collectionView.frame = CGRect(x: 0, y: self.view.frame.height / 2, width: self.view.frame.width, height: self.view.frame.height / 2)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        collectionView.dataSource = self
        collectionView.delegate = self
    }

}
extension ViewController: UICollectionViewDelegate {}
extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "cells", for: indexPath) as? CollectionViewCell)!
        cell.image = images[indexPath.item]
        return cell
    }
}


