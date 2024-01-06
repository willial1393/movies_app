# movies_app

Application for movies using themoviedb API

## Getting Started

Install flutter 3.16.5

Create `config.json` file on root directory

```bash
flutter pub get
```

## Run

```bash
flutter run --dart-define-from-file="config.json"
```

## Generate Routes

```bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```

## Generate App Icon

```bash
flutter pub run flutter_launcher_icons
```

## Generate Splash Screen

```bash
flutter pub run flutter_native_splash:create
```