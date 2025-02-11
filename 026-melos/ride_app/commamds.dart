//*! Commands
//1- dart pub global activate melos 
// dart pub add melos --dev
// melos bootstrap 
//* melos exec -- flutter pub get
//* melos exec -- flutter test


//*! Structure of the project
// ride_app/
// ├── core/ ========> # shared code between all packages
// │   ├── lib/
// │   │   ├── constants.dart
// │   │   ├── utils.dart
// │   │   └── shared_widgets.dart
// │   └── pubspec.yaml
// ├── auth/ ========> # authentication package for login and signup
// │   ├── lib/
// │   │   ├── login_screen.dart
// │   │   ├── signup_screen.dart
// │   │   └── auth_service.dart
// │   └── pubspec.yaml
// ├── client/ ========> # client package for client related features
// │   ├── lib/
// │   │   ├── home_screen.dart
// │   │   └── client_service.dart
// │   └── pubspec.yaml
// ├── driver/ ========> # driver package for driver related features
// │   ├── lib/
// │   │   ├── home_screen.dart
// │   │   └── driver_service.dart
// │   └── pubspec.yaml
// ├── app/   ========> # main app package that uses all other packages
// │   ├── lib/
// │   │   └── main.dart
// │   └── pubspec.yaml
// └── melos.yaml   ========> # melos configuration file for managing packages