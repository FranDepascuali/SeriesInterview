//
//  Identifiers.swift
//  Series
//
//  Created by Francisco Depascuali on 21/01/2019.
//  Copyright © 2019 depa. All rights reserved.
//

import Foundation

enum CellIdentifier: String {
    case showPreviewCell
    case subscribedShowCell

    var cellClass: AnyClass {
        switch self {
        case .showPreviewCell:
            return ShowPreviewCell.self
        case .subscribedShowCell:
            return SubscribedShowPreviewCell.self
        }
    }
}

