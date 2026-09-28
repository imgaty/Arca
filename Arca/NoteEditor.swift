import SwiftUI

struct NoteEditor: View {
    @State private var note = AttributedString()
    @State private var selection = AttributedTextSelection()
    @FocusState private var isEditing: Bool
    @Namespace private var bar

    var body: some View {
        NavigationStack {
            TextEditor(text: $note, selection: $selection)
                .focused($isEditing)
                .safeAreaPadding(.horizontal, 19)
                .onChange(of: selection, initial: true, styleEmptyParagraph)
                .onAppear { isEditing = true }
                .safeAreaBar(edge: .bottom) { editingBar }
                .toolbar { Button("Share", systemImage: "square.and.arrow.up") {} }
        }
    }

    private var editingBar: some View {
        GlassEffectContainer {
            HStack {
                if isEditing {
                    HStack(spacing: 14) {
                        // Placeholders
                        Button("Bold", systemImage: "bold") {}
                        Button("Italic", systemImage: "italic") {}
                    }
                    .buttonStyle(.plain)
                    .padding(7)
                    .glassEffect(.regular.interactive())
                    .glassEffectID("format", in: bar)
                    
                    Spacer()
                    
                    Button("Done", systemImage: "checkmark") { isEditing = false }
                        .glassEffectID("done", in: bar)
                } else {
                    Button("Delete", systemImage: "trash") {}
                        .glassEffectID("delete", in: bar)
                    
                    Spacer()
                    
                    Button("New Note", systemImage: "square.and.pencil") {}
                        .glassEffectID("new", in: bar)
                }
            }
        }
        .labelStyle(BarIconStyle())
        .buttonStyle(.glass)
        .buttonBorderShape(.circle)
        .animation(.default, value: isEditing)
        .padding([.horizontal, .bottom], 16)
        .dynamicTypeSize(...DynamicTypeSize.xLarge)
    }

    private func styleEmptyParagraph() {
        guard case .insertionPoint(let caret) = selection.indices(in: note) else { return }

        let text = note.characters
        guard text[..<caret].last ?? "\n" == "\n",
              text[caret...].first ?? "\n" == "\n" else { return }

        let font = (caret == text.startIndex ? NoteStyle.title : .body).font
        note.transformAttributes(in: &selection) { $0.font = font }
    }
}

private struct BarIconStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        Label {
            configuration.title
        } icon: {
            configuration.icon
                .font(.title3)
                .frame(width: 30, height: 30)
                .contentShape(.rect)
        }
        .labelStyle(.iconOnly)
        .accessibilityShowsLargeContentViewer()
    }
}
