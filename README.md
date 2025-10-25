# Flowery E-Commerce App

**Flowery — a Flutter-based mobile e-commerce application for selling flowers and related products.**

---

## Project Overview
Flowery is a cross-platform (Android / iOS) Flutter e-commerce application focused on shopping for flowers and related items. It follows production-ready development practices including CI automation and code generation.

---

## Tech Stack
- **Flutter** (UI)
- **Dart** (language)
- **Bloc** for state management
- **Dio + Retrofit** for networking
- **json_serializable** for model generation
- **Injectable** for dependency injection
- **Cached Network Image** for optimized images
- **mockito** for testing

---

## Architecture
- **Clean Architecture Inspired**
- Data / Domain / Presentation separation
- **Bloc/Cubit** for state management With MVI Pattern
- **Code generation** for DI, networking, models

---

## Features
- Product listing and details
- Product search functionality
- Flower categories
- Secure authentication
- Local caching
- Modern UI/UX for smooth shopping
- Cart and checkout flow

---

## Testing
- Unit & Widget tests using `flutter_test`
- Mocks using `mockito`
- Test command:
```bash
flutter test
```

---

## Folder Structure
```
/android                      # Android native project files
/ios                          # iOS native project files
/lib
  /core                       # utilities, theming, helpers
  /data                       # repositories, data sources, models (dto)
  /domain                     # entities, use-cases
  /features
    /home
    /product
    /cart
    /auth
  /presentation               # blocs/cubits, pages, widgets
  main.dart
/test                         # unit & widget tests
/.github/workflows            # CI: linting, distribution, PR checks
/pubspec.yaml
/analysis_options.yaml
```

---

## How to Run the Project
1. Install Flutter (stable channel recommended)
2. Get dependencies:
```bash
flutter pub get
```
3. Generate code:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```
4. Run the app:
```bash
flutter run
```
5. Build an APK:
```bash
flutter build apk --release
```

---

## CI / CD
- GitHub Actions for linting, building & distribution
- Fastlane workflow for Firebase App Distribution

---

## Future Improvements
- Full integration tests for critical flows
- Release automation & versioning setup
- Enhanced analytics & performance monitoring
- Screen previews and demo videos
- Secure environment variables for API configuration

---

## Screenshots
Add screenshots to `/assets/screenshots/` then include here:
```md

```

---

## Social Links
- **Developer**: Add your name
- **GitHub**: Add repo URL
- **LinkedIn / Twitter**: Add profile links

---

## License
Choose a license (MIT recommended)
