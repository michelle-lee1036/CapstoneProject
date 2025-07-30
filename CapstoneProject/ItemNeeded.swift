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
