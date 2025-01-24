# Notes App

A simple and intuitive notes application built with Flutter. This app allows users to create, edit,
delete, and search notes efficiently.

## Features

- **Create Notes**: Users can create new notes with a title, content, and color.
- **Edit Notes**: Users can edit existing notes by tapping on them.
- **Delete Notes**: Users can delete notes using the delete button.
- **Search Notes**: Users can search for notes by title.
- **Sort Notes**: Notes are automatically sorted by date, with the most recent notes appearing
  first.
- **Persistent Storage**: Notes are stored persistently using Hive, ensuring data is not lost
  between sessions.

## Getting Started

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) (version 2.0 or higher)
- [Dart](https://dart.dev/get-dart)
- [Android Studio](https://developer.android.com/studio)
  or [Visual Studio Code](https://code.visualstudio.com/)

### Installation

1. **Clone the repository**:
    ```sh
    git clone https://github.com/your-username/notes_app.git
    ```

2. **Navigate to the project directory**:
    ```sh
    cd notes_app
    ```

3. **Install dependencies**:
    ```sh
    flutter pub get
    ```

4. **Run the app**:
    ```sh
    flutter run
    ```

## Project Structure

- `lib/`: Contains the main source code for the application.
    - `views/`: Contains the UI components.
        - `widgets/`: Contains reusable widgets.
    - `cubits/`: Contains the state management logic using Cubit.
    - `models/`: Contains the data models.

## Dependencies

- [Flutter Bloc](https://pub.dev/packages/flutter_bloc): State management library.
- [Hive](https://pub.dev/packages/hive): Lightweight and fast key-value database.
- [Font Awesome Flutter](https://pub.dev/packages/font_awesome_flutter): Icon pack for Flutter.

## Contributing

Contributions are welcome! Please fork the repository and create a pull request with your changes.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.