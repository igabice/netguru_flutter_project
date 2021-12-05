# Netguru Flutter: Recruitment CR task

### Prerequisites
Things that you need to have before starting working with a project.
<!-- This should be rather obvious for Flutter dev, but could be helpful for anyone else. -->

- [Install Flutter](https://flutter.dev/docs/get-started/install) with:
    - Install Xcode
    - Install Android Studio
    - Install Cocoapods
    - Set up iOS simulator and Android emulator
- [Set up IDE with plugins](https://flutter.dev/docs/get-started/editor)

### Installation
Step by step instructions what you need to do after fulfilling the prerequisites to launch the application.

1. Clone project from GIT
2. Run `flutter pub get`.
3. Run `flutter pub run build_runner build --delete-conflicting-outputs`.
4. Run the app and that should be it.


### Run Tests
- Test SplashScreen:
flutter test test/feature/splash/splash_test.dart
- Test MainScreen:
flutter test test/feature/main/main_test.dart