Voicly is a modular Flutter-based calling platform built using a mono-repo architecture.
It contains two separate applications (User & Caller) powered by a shared core package for reusable UI, theme, and utilities.

This structure ensures:
Code reusability
Clean architecture
Consistent UI across apps
Scalable development

```bash
voicly/
│
├── apps/
│   ├── voicly_app/
│   └── voicly_caller/
│
├── packages/
│   └── core/
│       ├── lib/
│       │   ├── constants/
│       │   ├── theme/
│       │   ├── utils/
│       │   ├── widget/
│       │   └── core.dart
│       │
│       ├── pubspec.yaml
│       ├── analysis_options.yaml
│       ├── LICENSE
│       └── CHANGELOG.md
│
└── README.md
```

