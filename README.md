[![Pub Version](https://img.shields.io/pub/v/age_birthday_and_date_calculator?style=flat-square&color=blue)](https://pub.dev/packages/age_birthday_and_date_calculator)
[![GitHub Stars](https://img.shields.io/github/stars/JoyatuBarua/age_birthday_and_date_calculator?style=flat-square)](https://github.com/JoyatuBarua/age_birthday_and_date_calculator/stargazers)
[![License](https://img.shields.io/badge/license-BSD--2--Clause-orange?style=flat-square)](https://github.com/JoyatuBarua/age_birthday_and_date_calculator/blob/main/LICENSE)
[![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=flat-square&logo=Flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=flat-square&logo=dart&logoColor=white)](https://dart.dev)

## Introduction ── .✦

A lightweight Dart/Flutter package designed to simplify date-based calculations keeping leap years into consideration. Easily calculate a person's age, the duration between two dates, and the countdown to their next birthday.

## Features ✨

- **Age Calculation:** Get age in years, months, days and remaining days after weeks are considered simultaneously.

- **Birthday Countdown:** Calculate how many months and days are left until the next birthday.

- **Date Difference:** Find the total duration between any two `DateTime` objects.

- **Leap Year Aware:** Calculations accounting for leap years and varying month lengths (e.g., February 29th is correctly processed).

- **Zero Dependencies:** Built using pure Dart for maximum compatibility and performance.

- **Supports All Platforms:** Supported platforms are Android, iOS, macOS, Web, Windows, Linux.

<br>

<div align = "center">
  <img src="https://raw.githubusercontent.com/JoyatuBarua/age_birthday_and_date_calculator/main/screenshot_age_calculator.jpeg" width="250">
</div>

## Installation ⚙️

Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  age_birthday_and_date_calculator: ^1.0.0
```

## Usage 🧱

### 1. Calculate Age:

Get the exact age of a person from their birthdate to the current date.

```dart
import 'package:age_birthday_and_date_calculator/age_birthday_and_date_calculator.dart';

void main() {
  DateTime birthDateTime = DateTime(1996, 2, 29);
  DateTime currentDateTime = DateTime.now();

  Age age = Age(birthDateTime: birthDateTime, currentDateTime: currentDateTime);

  print(
    'Age: ${age.inYears} years, ${age.inMonths} months, ${age.inDays} days',
  ); // when week is not counted

  print(
    'Age: ${age.inYears} years, ${age.inMonths} months, ${age.inWeeks} weeks, ${age.inRemainingDays} days',
  ); // when week is counted
}
```

### 2. Calculate Duration Between Two Dates:

Get the exact duration between two dates in years, months, weeks, days, hours, and minutes.

```dart
import 'package:age_birthday_and_date_calculator/age_birthday_and_date_calculator.dart';

void main() {
  DateTime date1 = DateTime(1996, 2, 29);
  DateTime date2 = DateTime.now();

  DateCalculate date = DateCalculate(
    firstDateTime: date1,
    secondDateTime: date2,
  );

  print(
    'Duration: ${date.inYears} years, ${date.inMonths} months, ${date.inWeeks} weeks, ${date.inDays} days, ${date.inHours} hours, ${date.inMinutes} minutes',
  );
}
```

### 3. Next Birthday countdown:

Calculate exactly how much time is left until the next celebration in months and days.

```dart
import 'package:age_birthday_and_date_calculator/age_birthday_and_date_calculator.dart';

void main() {
  DateTime birthDateTime = DateTime(1996, 2, 29);
  DateTime currentDateTime = DateTime.now();

  NextBirthDay nextBirthDay = NextBirthDay(
    birthDateTime: birthDateTime,
    currentDateTime: currentDateTime,
  );

  print(
    'Next Birthday until: ${nextBirthDay.inMonths} months, ${nextBirthDay.inDays} days',
  );
}
```

## Repository 🛢️

Find the source code and contribute on GitHub:
<br>
<a href="https://github.com/JoyatuBarua/age_birthday_and_date_calculator">
Repository
</a>

## License ⚖️

This project is licensed under the BSD 2-Clause License - see the LICENSE file for details.

## Contributing 🤝

Feel free to open issues or submit pull requests to help improve this package.
