import SwiftUI

struct NoteEditor: UIViewRepresentable {
    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.delegate = context.coordinator
        view.textContainerInset = .init(top: 12, left: 24, bottom: 24, right: 24)
        view.textContainer.lineFragmentPadding = 0
        view.typingAttributes = NoteStyle.standard(forParagraphAt: 0).attributes
        DispatchQueue.main.async { view.becomeFirstResponder() }
        return view
    }

    func updateUIView(_ view: UITextView, context: Context) {}

    func makeCoordinator() -> StyleCoordinator {
        StyleCoordinator()
    }

    final class StyleCoordinator: NSObject, UITextViewDelegate {
        func textViewDidChangeSelection(_ view: UITextView) {
            let caret = view.selectedRange
            guard caret.length == 0 else { return }

            let text = view.text as NSString
            let paragraph = text.paragraphRange(for: caret)
            let isEmptyParagraph = paragraph.length == 0 ||
                (paragraph.length == 1 && text.substring(with: paragraph) == "\n")
            guard isEmptyParagraph else { return }

            view.typingAttributes = NoteStyle
                .standard(forParagraphAt: paragraph.location).attributes
        }
    }
}
	
