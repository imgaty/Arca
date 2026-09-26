import UIKit

extension NSAttributedString.Key {
    // Unused for now. The style picker will need it to tell the caret's style.
    static let noteStyle = NSAttributedString.Key("arcaNoteStyle")
}

enum NoteStyle: String, CaseIterable {
    case title, subtitle, body, small

    static func standard(forParagraphAt offset: Int) -> NoteStyle {
        offset == 0 ? .title : .body
    }

    var attributes: [NSAttributedString.Key: Any] {
        let (style, weight, spacing): (UIFont.TextStyle, UIFont.Weight, CGFloat) =
        switch self {
            case .title:    (.title1, .bold, 16)
            case .subtitle: (.title3, .semibold, 14)
            case .body:     (.body, .regular, 12)
            case .small:    (.footnote, .regular, 10)
        }

        let font = UIFont(descriptor: UIFontDescriptor
            .preferredFontDescriptor(withTextStyle: style)
            .addingAttributes([.traits: [UIFontDescriptor.TraitKey.weight: weight]]),
            size: 0)

        let paragraph = NSMutableParagraphStyle()
        paragraph.paragraphSpacing = UIFontMetrics(forTextStyle: style)
            .scaledValue(for: spacing)

        return [
            .font: font,
            .paragraphStyle: paragraph,
            .noteStyle: rawValue    // `rawValue`, not `self` — attribute values must be archivable.
        ]
    }
}
