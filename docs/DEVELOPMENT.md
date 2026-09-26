# Development

`Created: 26 September 2026` | `Last updated: 26 September 2026`

<br>

## Project structure

```text
├── Arca/                     # App source
│   ├── Assets.xcassets/      # App icon and accent colour
│   ├── ArcaApp.swift         # App entry point
│   ├── NoteEditor.swift      # UITextView wrapped for SwiftUI
│   └── NoteStyle.swift       # The style table
├── Arca.xcodeproj/           # Xcode project
├── docs/
│   └── DEVELOPMENT.md        # This file
├── LICENSE                   # MIT license
└── README.md                 # Project overview
```

<br>

## Requirements

| Requirement | Details |
|---|---|
| Xcode | 27 |
| Deployment target | iOS 27 |
| Swift language mode | 5 |
| Devices | iPhone, iPad |

<br>

## Features

- [x] `Single text view`: one continuous editor where the first line is the
  title.
- [x] `Style table`: text styles, weights, and paragraph spacing that follow
  Dynamic Type.
- [ ] `Categories`: group notes by category.
- [ ] `Character formatting`: bold, italic, and links.
- [ ] `Dynamic Type restyling`: update existing text when the system text size
  changes.
- [ ] `Filtering`: find notes by date, device, category, or name.
- [ ] `Folders`: organise notes into folders.
- [ ] `Notes list`: browsing and switching between saved notes.
- [ ] `Persistence`: loading and saving notes. `updateUIView` is empty today,
  so nothing can tell the editor what to display.
- [ ] `Sharing`: move notes between devices, online and offline.
- [ ] `Style picker`: set the caret's paragraph style, using the `.noteStyle`
  attribute already written onto the text to report the current one.
