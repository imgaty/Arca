import SwiftUI

enum NoteStyle: CaseIterable {
    case title, subtitle, body, small

    var font: Font {
        switch self {
            case .title:    .title.bold()
            case .subtitle: .title3.weight(.semibold)
            case .body:     .body
            case .small:    .footnote
        }
    }
}
