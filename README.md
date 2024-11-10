# Flutter Clip Link
Cross-platform URL Shortener App to create short links for your favourite websites powered by Flutter and [spoo.me](https://spoo.me/)


## Technologies Used ⚙

| Dart       | Flutter   | DevTools  |
| ---------- | --------- | --------- |
| `3.5.3` | `3.24.3` | `2.37.3`    |


## Screenshots & Demo 📸 

## Get Started 🚀
Before you start, make sure you have the following installed:

- Flutter SDK `3.24.4`
- Dart SDK `3.5.3`

### Clone the repo
- Clone the repo
```bash
git clone https://github.com/utrodus/flutter_clip_link
```

### Install dependencies
run the following command to install all the dependencies
```bash
flutter pub get
```

### Run the app
- in Visual Studio Code, navigate to run and debug section
- choose the `flutter_clip_link` configuration
  - if you choose `flutter_clip_link`, it will run in debug mode in selected device
  - for web, choose `flutter_clip_link (web)`

> Now you're ready to go! 🚀

## Architecture 🏗️

The architecture of the **Flutter Clip Link app** is based on the **bloc architecture** guidelines, which promotes a clean and organized codebase. 

Read more about the architecture [here](https://bloclibrary.dev/architecture).


## Project Structure 📁
<details>
<summary>Click to toggle contents of Project Structure</summary>

--- 
Clip link app use project structure as follows:

```bash
flutter_clip_link
├── lib
│   ├── main.dart
│   ├── src
│   |   ├── core
│   |   ├── features
│   │   │   ├── favorited
│   │   │   ├── main
│   │   │   ├── search
│   │   │   ├── settings
│   │   │   ├── shorten
│   │   │   ├── splash
│   │   ├── routes
│   │   ├── app.dart
│   │   ├── init_di.dart   
├── test
```

Here's the explanation in list form:

- **lib**: Main directory for application code.
  - **main.dart**: Entry point for the Flutter application.
  - **src**: Contains core components and feature-specific modules.
    - **core**: Shared resources and configurations (e.g., utilities, constants, theme settings).
    - **features**: Modules for different functionalities, organized as follows:
      - **favorited**: Manages user-favorited links.
      - **main**: Main interface or dashboard for the app.
      - **search**: Provides search capabilities within the app.
      - **settings**: Manages user preferences and app settings.
      - **shorten**: Contains logic for URL shortening functionality.
      - **splash**: Displays the splash screen, typically the app’s first screen.
    - **routes**: Configures app navigation and routing.
    - **app.dart**: Contains the main app widget structure and setup.
    - **init_di.dart**: Manages dependency injection, initializing services and dependencies.
- **test**: Directory for unit and widget tests, ensuring feature reliability and performance.

> This organized structure supports scalability and maintainability, following a modular approach that simplifies adding and updating features.


</details>


## Routes 🚃

The **routes** folder serves as the central point for managing the navigation in the app. It contains two main files that handle the application's routing: `routes.dart` and `app_router.dart`.


<details>
<summary>routes.dart </summary>


The `routes.dart` file stores all the route names used throughout the app. Each route has a unique string identifier that will be used to navigate between pages or screens in the application.

Code in this file:
```dart
enum Routes {
  splash('/'),
  listShorten('/list-shorten'),
  addNewShortenURL('add-new-shorten-url'),
  detailShortenURL('detail-shorten-url'),
  listFavorites('/list-favorites'),
  search('search'),
  settings('/settings'),
  about('about'),
  faq('faq');

  const Routes(this.path);
  final String path;
}
```
The route names are created with enums, which are a special type of class that can be used to define a set of named constants.

</details>

<details>
<summary> app_router.dart</summary>


The `app_router.dart` file is responsible for **router configuration** using the `go_router` package. 

GoRouter is used to manage navigation logic, including conditional routes, dynamic routes, and nested routes. GoRouter also supports more complex route management, such as passing parameters or handling nested routes.

Example Structure of `app_router.dart`:
```dart
import 'package:go_router/go_router.dart';
import 'routes.dart';
import 'package:your_app/pages/home_page.dart';
import 'package:your_app/pages/login_page.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => HomePage(),
    ),  
    // Add other routes here
  ],
);
```

In this file, each route name from `routes.dart` is connected to its corresponding widget, such as `HomePage()`. 

</details>