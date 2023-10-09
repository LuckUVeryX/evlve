# Evlve

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

Generated by the [Very Good CLI][very_good_cli_link] 🤖

---

## Features

### View & Book Classes

<p float="left">
    <img src="screenshots/schedules.png" alt="Schedules" style="width:200px"/>
    <img src="screenshots/schedules-dark.png" alt="SchedulesDark" style="width:200px"/>
</p>

### Keep track of your attendance

<p float="left">
    <img src="screenshots/attendance-list-grid.png" alt="Attendance List Grid" style="width:200px"/>
    <img src="screenshots/attendance-list-grid-dark.png" alt="Attendance List Grid Dark" style="width:200px"/>
    <img src="screenshots/attendance-graph.png" alt="Attendance Graph" style="width:200px"/>
    <img src="screenshots/attendance-graph-dark.png" alt="Attendance Graph Dark" style="width:200px"/>
    <img src="screenshots/attendance-list.png" alt="Attendance List" style="width:200px"/>
    <img src="screenshots/attendance-list-dark.png" alt="Attendance List Dark" style="width:200px"/>
</p>

### Switch between Evolve Facilities

<p float="left">
    <img src="screenshots/facilities.png" alt="Facilities" style="width:200px"/>
    <img src="screenshots/facilities-dark.png" alt="Facilities Dark" style="width:200px"/>
</p>

### Shake to show QR code for check in

<p float="left">
    <img src="screenshots/qr.png" alt="QR" style="width:200px"/>
    <img src="screenshots/qr-dark.png" alt="QR Dark" style="width:200px"/>
    <img src="screenshots/qr-settings.png" alt="QR Settings" style="width:200px"/>
    <img src="screenshots/qr-settings-dark.png" alt="QR Settings Dark" style="width:200px"/>
</p>

### Notify you before class starts

<p float="left">
    <img src="screenshots/notifications.png" alt="Notifications" style="width:200px"/>
    <img src="screenshots/notifications-dark.png" alt="Notifications Dark" style="width:200px"/>
</p>

### Settings

<p float="left">
    <img src="screenshots/theme.png" alt="Settings" style="width:200px"/>
    <img src="screenshots/theme-dark.png" alt="Settings Dark" style="width:200px"/>
</p>

---

## Getting Started 🚀

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

_\*Evlve works on iOS, Android._

---

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

---

## Working with Translations 🌐

This project relies on [flutter_localizations][flutter_localizations_link] and follows the [official internationalization guide for Flutter][internationalization_link].

### Adding Strings

1. To add a new localizable string, open the `app_en.arb` file at `lib/l10n/arb/app_en.arb`.

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

2. Then add a new key/value and description

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    },
    "helloWorld": "Hello World",
    "@helloWorld": {
        "description": "Hello World Text"
    }
}
```

3. Use the new string

```dart
import 'package:evlve/l10n/l10n.dart';

@override
Widget build(BuildContext context) {
  final l10n = context.l10n;
  return Text(l10n.helloWorld);
}
```

### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include the new locale.

```xml
    ...

    <key>CFBundleLocalizations</key>
	<array>
		<string>en</string>
	</array>

    ...
```

### Adding Translations

1. For each supported locale, add a new ARB file in `lib/l10n/arb`.

```
├── l10n
│   ├── arb
│   │   └── app_en.arb
```

2. Add the translated strings to each `.arb` file:

`app_en.arb`

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://github.com/VeryGoodOpenSource/very_good_cli
