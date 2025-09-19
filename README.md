# 📱 Flowery App

Flowery is a modern Flutter e-commerce application built to provide a smooth, elegant, and user-friendly shopping experience for buying flowers online.

This project was a great opportunity to apply Clean Architecture, Bloc (Cubit) for state management, and best practices like Repository Pattern, Dependency Injection, and GitHub Actions for CI/CD.

🚀 Features

✅ Clean Architecture

Organized into Presentation, Domain, and Data layers.

Improves scalability, testability, and maintainability.

✅ State Management with Cubit (Bloc)

Reactive UI state handling (Loading, Success, Error).

Easy to scale for multiple features.

✅ Repository Pattern

Centralized data access (API + Cache).

Decouples business logic from data sources.

✅ Dependency Injection

Implemented with injectable + get_it for clean DI setup.

Simplifies object creation & testing.

✅ API Integrations

Dynamic product, category, and offers fetching from remote APIs.

DTOs used for safe serialization & mapping.

✅ Caching & Offline Support

Local caching of products and categories for faster load times.

Provides a basic offline experience.

✅ Authentication & Token Handling

Login with email/password.

Token storage using SharedPreferences.

Automatic token refresh logic.

✅ Favorites & Cart Management

Add/remove products to favorites.

Persistent cart with dynamic price calculations (discounts included).

✅ Payment Handling

Clean payment flow with extendable logic for real payment gateways.

✅ Firebase Integration

🔥 Firestore for real-time product & offer updates.

📲 Push Notifications for new offers or restocks.

🛡 Crashlytics for real-time crash monitoring.

📊 Analytics for user behavior tracking & event logging.

✅ Unit Testing

Use cases, repositories, and cubits covered with tests.

Ensures code reliability and maintainability.

✅ Responsive UI

Built with flutter_screenutil for all screen sizes & orientations.

Clean, minimal, and user-friendly design.

✅ GitHub Actions (CI/CD)

Automated build & test workflows.

Helps ensure code quality before merging changes.

🛠️ Technical Highlights

Bloc/Cubit for state management.

Injectable + GetIt for dependency injection.

Dartz for functional error handling (Either<Failure, T>).

SharedPreferences for local storage.

Repository Pattern for a clean data layer.

Single Responsibility Principle applied to all layers.

GitHub Actions for CI/CD automation.

Modular file structure for scalability.
