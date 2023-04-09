# Flutter BLoC Widget

Flutter BLoC Widget is an experimental Flutter package that provides a new way to build widgets in Flutter applications using the BLoC (Business Logic Component) pattern. This package allows developers to extend the BlocWidget class instead of the traditional Stateful or Stateless widgets, making it easy to separate the UI from the business logic of the application.

With the Flutter BLoC Widget package, developers can write a separate BLoC class that manages the application state and logic, and then use the BlocWidget class to build the UI based on the state of the BLoC. The package also includes some additional features, such as automatic initialization of the BLoC and handling of errors and loading states.

Please note that this package is still experimental and should be used with caution. It is subject to changes and improvements, and may not be suitable for production use yet. Nonetheless, it provides an exciting new approach to building widgets in Flutter that developers may find useful in their projects.

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)
[![License: MIT][license_badge]][license_link]

## Installation 💻

**❗ In order to start using Flutter Bloc Widget you must have the [Flutter SDK][flutter_install_link] installed on your machine.**

Add `flutter_bloc_widget` to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_bloc_widget:
```

Install it:

```sh
flutter packages get
```

---

## Usage

To use the package, extend the `BlocWidget` class and implement the `build` method, which will be called whenever the BLoC's state changes. Here's an example:

```dart
class MyWidget extends BlocWidget<MyBloc, MyState> {
  const MyWidget({Key? key}) : super(key: key);

  @override
  final MyBloc blocInitializer => MyBloc();

  @override
  Widget build(BuildContext context, MyBloc bloc, MyState state) {
    // Build the UI based on the state of the BLoC
  }
}

class MyBloc extends Bloc<MyEvent, MyState> {
  // Implement the BLoC's state and event mapping
}
```

---

## Continuous Integration 🤖

Flutter Bloc Widget comes with a built-in [GitHub Actions workflow][github_actions_link] powered by [Very Good Workflows][very_good_workflows_link] but you can also add your preferred CI/CD solution.

Out of the box, on each pull request and push, the CI `formats`, `lints`, and `tests` the code. This ensures the code remains consistent and behaves correctly as you add functionality or make changes. The project uses [Very Good Analysis][very_good_analysis_link] for a strict set of analysis options used by our team. Code coverage is enforced using the [Very Good Workflows][very_good_coverage_link].

---

## Running Tests 🧪

For first time users, install the [very_good_cli][very_good_cli_link]:

```sh
dart pub global activate very_good_cli
```

To run all unit tests:

```sh
very_good test --coverage
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
open coverage/index.html
```

[flutter_install_link]: https://docs.flutter.dev/get-started/install
[github_actions_link]: https://docs.github.com/en/actions/learn-github-actions
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[logo_black]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_black.png#gh-light-mode-only
[logo_white]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_white.png#gh-dark-mode-only
[mason_link]: https://github.com/felangel/mason
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://pub.dev/packages/very_good_cli
[very_good_coverage_link]: https://github.com/marketplace/actions/very-good-coverage
[very_good_ventures_link]: https://verygood.ventures
[very_good_ventures_link_light]: https://verygood.ventures#gh-light-mode-only
[very_good_ventures_link_dark]: https://verygood.ventures#gh-dark-mode-only
[very_good_workflows_link]: https://github.com/VeryGoodOpenSource/very_good_workflows
