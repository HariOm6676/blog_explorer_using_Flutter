
# Blog Explorer

## Description

Blog Explorer is a Flutter application designed to allow users to browse, search, and manage blogs. The app features offline support using Hive for local storage, ensuring that users can access and interact with their favorite blogs even when offline. The application is built with Flutter and uses the BLoC pattern for state management.

## Features

- **Browse Blogs:** View a list of blogs categorized into different tabs (All, Merchants, Business, Tutorial, Favorites).
- **Search Blogs:** Use a search feature to find blogs based on keywords.
- **Manage Favorites:** Toggle favorite status for blogs.
- **Offline Support:** Access and interact with blogs offline using Hive for local storage.

## Technologies Used

- **Flutter:** Framework for building the cross-platform mobile application.
- **Dart:** Programming language used with Flutter.
- **BLoC Pattern:** State management using BLoC (Business Logic Component).
- **Hive:** Lightweight and fast key-value database for local storage.
- **HTTP:** Package for making network requests.

## Project Structure

```
lib/
│
├── blocs/
│   ├── search/
│   │   ├── search_bloc.dart
│   │   ├── search_event.dart
│   │   └── search_state.dart
│   ├── blog_bloc.dart
│   ├── blog_event.dart
│   └── blog_state.dart
│
├── models/
│   └── blog_model.dart
│
├── repositories/
│   └── blog_repository.dart
│
├── screens/
│   ├── blog_detail_screen.dart
│   └── blog_list_screen.dart
│
└── main.dart
```

## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK

### Installation

1. **Clone the Repository:**

   ```bash
   git clone <repository-url>
   cd blog_explorer
   ```

2. **Install Dependencies:**

   ```bash
   flutter pub get
   ```

3. **Run Build Runner:**

   Generate the necessary files for Hive:

   ```bash
   flutter packages pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the Application:**

   ```bash
   flutter run
   ```

## Usage

- **Browse Blogs:** Navigate through the app to view different categories of blogs.
- **Search Blogs:** Tap the search icon to search for blogs by title.
- **Toggle Favorites:** Tap the heart icon to mark blogs as favorites.
- **View Blog Details:** Tap on a blog card to view detailed information.

## Code Overview

- **`main.dart`:** Entry point of the application. Sets up the `MaterialApp` and provides BLoC providers.
- **`models/blog_model.dart`:** Defines the `Blog` model class with Hive support.
- **`repositories/blog_repository.dart`:** Handles network requests to fetch blogs from an API.
- **`blocs/`:** Contains BLoC logic for managing blog and search states.
- **`screens/`:** Contains UI screens including blog list and blog detail screens.

## Contributing

1. **Fork the Repository**
2. **Create a Feature Branch:**

   ```bash
   git checkout -b feature/new-feature
   ```

3. **Commit Your Changes:**

   ```bash
   git commit -am 'Add new feature'
   ```

4. **Push to the Branch:**

   ```bash
   git push origin feature/new-feature
   ```

5. **Open a Pull Request**

## Conclusion: 
Blog Explorer provides a seamless experience for browsing and managing blogs with offline capabilities, making it a reliable tool for blog enthusiasts.
