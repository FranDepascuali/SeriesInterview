//
//  UICollectionView.swift
//  Series
//
//  Created by Francisco Depascuali on 21/01/2019.
//  Copyright © 2019 depa. All rights reserved.
//

import UIKit

extension UICollectionView {

    func dequeueReusableCell<CellClass>(withIdentifier identifier: CellIdentifier, indexPath: IndexPath) -> CellClass {
        return dequeueReusableCell(withReuseIdentifier: identifier.rawValue, for: indexPath) as! CellClass
    }

    func registerIdentifier(_ identifier: CellIdentifier) {
        register(identifier.cellClass, forCellWithReuseIdentifier: identifier.rawValue)
    }

}
