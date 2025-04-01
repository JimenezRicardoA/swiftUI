//
//  ListModel.swift
//  mobileSwiftUI
//
//  Created by ITIT on 19/03/25.
//

import Foundation

struct ItemModel: Identifiable {
    let id = UUID()
    let name: String
    let description: String
}
