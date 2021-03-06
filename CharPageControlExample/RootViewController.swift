//  Copyright 2016 Nattawut Singhchai <jadedragon17650@gmail.com>
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

import UIKit
import CharPageControl

class ExampleCell: UICollectionViewCell {
    @IBOutlet
    var pageLabel: UILabel!
}

class RootViewController: UIViewController {
    
    var pageViewController: UIPageViewController?
    
    @IBOutlet weak var pageControl: CharPageControl!

    let pageCount:Int = 6
    
}

extension RootViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath) as? ExampleCell{
            cell.pageLabel.text = "PAGE \(indexPath.item + (1))"
            cell.pageLabel.backgroundColor = UIColor(hue: (1.0 / CGFloat(pageCount)) * CGFloat(indexPath.item), saturation: 0.1, brightness: 1.0, alpha: 1)
            return cell
        }
        return ExampleCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pageCount
    }
}

extension RootViewController: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentPage = (CGFloat(pageCount) * scrollView.contentOffset.x)/scrollView.contentSize.width
        pageControl.currentPage = currentPage
    }
}

extension RootViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
}

