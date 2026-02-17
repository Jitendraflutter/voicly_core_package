Voicly is a modular Flutter-based calling platform built using a mono-repo architecture.
It contains two separate applications (User & Caller) powered by a shared core package for reusable UI, theme, and utilities.

This structure ensures:
Code reusability
Clean architecture
Consistent UI across apps
Scalable development


📁 Project Structure
voicly/
│
├── apps/
│   ├── voicly_app/                # User App (Voicly)
│   └── voicly_caller/             # Receiver App (Voicly Caller)
│
├── packages/
│   └── core/
│       ├── .dart_tool/
│       ├── .idea/
│       ├── lib/
│       │   ├── constants/
│       │   │   ├── app_colors.dart
│       │   │   └── app_strings.dart
│       │   │
│       │   ├── theme/
│       │   │   └── app_theme.dart
│       │   │
│       │   ├── utils/
│       │   │   ├── app_info.dart
│       │   │   ├── helpers.dart
│       │   │   ├── show_custom_notification.dart
│       │   │   └── utils_method.dart
│       │   │
│       │   ├── widget/
│       │   │   ├── app_button.dart
│       │   │   ├── call_button.dart
│       │   │   ├── glass_container.dart
│       │   │   ├── loader.dart
│       │   │   ├── screen_wrapper.dart
│       │   │   └── voicly_avatar.dart
│       │   │
│       │   └── core.dart
│       │
│       ├── .flutter-plugins-dependencies
│       ├── .gitignore
│       ├── .metadata
│       ├── analysis_options.yaml
│       ├── CHANGELOG.md
│       ├── core.iml
│       ├── LICENSE
│       ├── pubspec.lock
│       └── pubspec.yaml
│
└── README.md
