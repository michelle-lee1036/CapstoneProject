//
//  ItemNeeded 2.swift
//  CapstoneProject
//
//  Created by Scholar on 7/29/25.
//


// ItemNeeded.swift
// CapstoneProject
//
// Created by Scholar on 7/28/25.
//
import Foundation
import SwiftData
@Model
class ItemNeeded {
  var title: String
  var isImportant: Bool
init(title: String, isImportant: Bool = false) {
    self.title = title
    self.isImportant = isImportant
  }
}
