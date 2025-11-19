//
//  Badge.swift
//  GratefulMoments
//
//  Created by Erik Sebastian de Erice Jerez on 19/11/25.
//

import Foundation
import SwiftData

@Model
class Badge {
    var details: BadgeDetails
    
    init(details: BadgeDetails) {
        self.details = details
    }
}

extension Badge {
    static var sample: Badge {
        Badge(details: .firstEntry)
    }
}
