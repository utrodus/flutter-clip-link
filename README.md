# Flutter Clip Link
Cross-platform URL Shortener App to create short links for your favourite websites powered by Flutter and [spoo.me](https://spoo.me/)


## Technologies Used ⚙

| Dart       | Flutter   | DevTools  |
| ---------- | --------- | --------- |
| `3.5.3` | `3.24.3` | `2.37.3`    |


## 🚀 Get Started 
Before you start, make sure you have the following installed:

- Flutter SDK `3.24.3`
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

## Routes

The **routes** folder serves as the central point for managing the navigation in the app. It contains two main files that handle the application's routing: `routes.dart` and `router.dart`.

`routes.dart`

The `routes.dart` file stores all the **route names** used throughout the app. Each route has a unique string identifier that will be used to navigate between pages or screens in the application.

Example Structure of `routes.dart`:
```dart
class AppRoutes {
  static const home = '/home';
  static const settings = '/settings';
  static const profile = '/profile';
  static const login = '/login';
}
```
In this file, route names are defined statically to ensure consistency and prevent duplication of string literals throughout the app.


`app_router.dart`

The `app_router.dart` file is responsible for **router configuration** using the **go_router** package. In this file, all the routes defined in `routes.dart` are configured to allow smooth navigation between screens in the application.

GoRouter is used to manage navigation logic, including conditional routes, dynamic routes, and nested routes.

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
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => LoginPage(),
    ),
    // Add other routes here
  ],
);
```

In this file, each route from `routes.dart` is connected to its corresponding widget, such as `HomePage()` or `LoginPage()`. GoRouter also supports more complex route management, such as passing parameters or handling nested routes.

