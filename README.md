# Omedia
- Flutter version used in the project 3.32.4


# How to Run the App

### Prerequisites

- Flutter SDK: 3.8.1 or higher (Project uses 3.32.4 Flutter version)
- Dart SDK: Latest stable version

### Installation

1. **Clone and navigate to the project:**
   ```bash
   cd omedia
   ```

2. **Install dependencies:**
   ```bash
   sh scripts/get_packages.sh
   ```

3. **Run the app:**
   ```bash
   flutter run
   ```

4. **Build for release:**
   ```bash
   flutter build apk
   ```

## Architecture

The application follows a clean, scalable architecture inspired by the BLoC pattern, with a strict separation of concerns.
I try to separate some services into separate packages, so it can be reused along projects.

### Project Structure

```
├── lib/
│   ├── src/
│   │   ├── bloc/
│   │   │   └── obligations_bloc/
│   │   ├── data/
│   │   │   ├── data_sources/
│   │   │   ├── models/
│   │   │   └── repositories/
│   │   ├── ui/
│   │   │   ├── screens/
│   │   │   │   └── pages/
│   │   │   │       ├── home_page/
│   │   │   │       ├── payment_details/
│   │   │   │       └── pdf_screen/
│   │   │   └── widgets/
│   │   ├── app_view.dart
│   │   └── app.dart
│   └── main.dart
├── packages/
│   └── ui_kit/
└── scripts/
```

### Architecture Layers

**Data Layer**: Handles API calls,  connections, and data models. 

**Business Logic Layer (BLoC)**: Manages application state and business rules. Handles user interactions and communicates between UI and data layers.

**Presentation Layer**: Contains UI components, screens, and widgets that react to BLoC state changes.

**UI Kit Package**: Reusable design system components for consistent theming across the application.

## State Management: BLoC Pattern

BLoC was chosen for several reasons:

1. **Separation of Concerns**: Clear separation between UI and business logic
2. **Testability**: Easy to unit test business logic independently  
3. **Reactive Programming**: Handles streams of data efficiently
4. **Performance**: Optimized rebuilds using BlocBuilder and context.select()
5. **Scalability**: Suitable for complex, growing applications

I utilized methods such as context.select for only listening to necessary parameter changes in widgets.  this types of optimization can help the application in long term especially with frequent data updates

## Key Assumptions

- **BLoC Pattern for Scalability**: Implemented BLoC (Business Logic Component) pattern using `flutter_bloc` for state management, assuming this fintech app will scale and require robust state management across multiple features
- **Loan Management Focus**: The app is designed around loan obligations (gold loans, other loans) with payment tracking and PDF document handling capabilities
- **Network Connectivity**: Assumes reliable internet connection for API calls using Dio HTTP client
- **PDF Document Support**: Integrated PDF viewing capabilities assuming users need to view loan documents and payment receipts
- **Multi-platform Support**: Built with cross-platform deployment in mind (iOS and Android)

## Dependencies
Core dependencies include flutter_bloc for state management, dio for HTTP requests, and PDF handling capabilities.