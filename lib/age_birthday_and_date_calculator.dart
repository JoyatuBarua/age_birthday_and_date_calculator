/// Method for calculating year, month, week, remaining day, day, hour, minute, second for different birth and current year
String calculateYearMonthWeekRemainingdayDayHourMinuteSecondsForDifferentYears(
  DateTime birthDateTime,
  DateTime currentDateTime,
  int yearDifference,
) {
  int durationInYears = currentDateTime.year - birthDateTime.year;
  int durationInMonths = currentDateTime.month - birthDateTime.month;
  int durationInDays = currentDateTime.day - birthDateTime.day;

  // print("$durationInYears $durationInMonths $durationInDays");

  // if currentDay is before/less than birthDay
  if (durationInDays < 0) {
    durationInMonths--;

    int daysInPrevMonth = DateTime(
      currentDateTime.year,
      currentDateTime.month,
      0,
    ).day;

    // print("days in previous month $daysInPrevMonth");
    durationInDays +=
        daysInPrevMonth; // durationInDays indicates total number of days if week is not counted
  }

  // if currentMonth is before/less than birthMonth
  if (durationInMonths < 0) {
    // the duration is not equal or greater than year thus decrement year by 1 and increase months by 12
    durationInYears--;
    durationInMonths += 12;
  }

  Duration difference = currentDateTime.difference(birthDateTime);

  int weeks = (durationInDays / 7).floor();
  int remainingDays =
      durationInDays %
      7; // remainingDays indicates days left after week is counted

  // print(
  //   'duration in days $durationInDays remaining weeks $weeks remaining days $remainingDays',
  // );

  int totalHours = difference.inHours;
  int totalMinutes = difference.inMinutes;
  int totalSeconds = difference.inSeconds;

  return "$durationInYears $durationInMonths $weeks $remainingDays $durationInDays $totalHours $totalMinutes $totalSeconds";
}

/// Method for calculating month, week, remaining day, day, hour, minute, second for the same birth and current year
String calculateMonthWeekRemainingdayDayHourMinuteSecondForSameYears(
  DateTime birthDateTime,
  DateTime currentDateTime,
) {
  int durationInMonths = currentDateTime.month - birthDateTime.month;
  int durationInDays = currentDateTime.day - birthDateTime.day;

  // if currentDay is before/less than birthDay
  if (durationInDays < 0) {
    durationInMonths--;
    int daysInPrevMonth = DateTime(
      currentDateTime.year,
      currentDateTime.month,
      0,
    ).day;
    durationInDays +=
        daysInPrevMonth; // durationInDays indicates total number of days if week is not counted
  }

  Duration totalDuration = currentDateTime.difference(birthDateTime);

  int weeks = (durationInDays / 7).floor();

  int remainingDays =
      durationInDays %
      7; // remainingDays indicates days left after week is counted

  int totalHours = totalDuration.inHours;
  int totalMinutes = totalDuration.inMinutes;
  int totalSeconds = totalDuration.inSeconds;

  // print('total days $totalDays remaining days $remainingDays');

  return "$durationInMonths $weeks $durationInDays $remainingDays $totalHours $totalMinutes $totalSeconds";
}

/// Method for calculating duration
String calculateDuration(
  int yearDifference,
  String age,
  DateTime currentDateTime,
  DateTime birthDateTime,
) {
  int birthMonth = 0;
  int currentMonth = 0;
  int birthYear = 0;
  int currentYear = 0;
  birthMonth = birthDateTime.month;
  currentMonth = currentDateTime.month;
  birthYear = birthDateTime.year;
  currentYear = currentDateTime.year;
  if (birthYear == currentYear) {
    yearDifference = 0;

    if (birthMonth == currentMonth) {
      String monthWeekDayHourMinuteSeconds =
          calculateMonthWeekRemainingdayDayHourMinuteSecondForSameYears(
            birthDateTime,
            currentDateTime,
          );

      age = '$yearDifference $monthWeekDayHourMinuteSeconds';
      return age;
    }

    String monthWeekRemainingdayDayHourMinuteSeconds =
        calculateMonthWeekRemainingdayDayHourMinuteSecondForSameYears(
          birthDateTime,
          currentDateTime,
        );

    age = '$yearDifference $monthWeekRemainingdayDayHourMinuteSeconds ';
    // print("Age is $age");
    // return;
  } else {
    String yearMonthWeekRemainingdayDayHourMinuteSeconds =
        calculateYearMonthWeekRemainingdayDayHourMinuteSecondsForDifferentYears(
          birthDateTime,
          currentDateTime,
          yearDifference,
        );
    age = "$yearMonthWeekRemainingdayDayHourMinuteSeconds ";

    // print("Age is $age");
    // return;
  }
  return age;
}

///  Class used for getting duration between dates
class DateCalculate {
  /// First Date
  DateTime firstDateTime;

  /// Second Date
  DateTime secondDateTime;

  /// Date duration in total years
  int inYears = 0;

  /// Date duration in total months
  int inMonths = 0;

  /// Date duration in total weeks
  int inWeeks = 0;

  /// Date duration in total days
  int inDays = 0;

  /// Date duration in total hours
  int inHours = 0;

  /// Date duration in total minutes
  int inMinutes = 0;

  /// Date duration in total seconds
  int inSeconds = 0;

  /// Constructor of DateCalculate class with two required parameters
  DateCalculate({required this.firstDateTime, required this.secondDateTime}) {
    late DateTime? temp;
    if (firstDateTime.isAfter(secondDateTime)) {
      temp = secondDateTime;
      secondDateTime = firstDateTime;
      firstDateTime = temp;
    }
    int years = secondDateTime.year - firstDateTime.year;
    int months = secondDateTime.month - firstDateTime.month;
    int days = secondDateTime.day - firstDateTime.day;

    // if currentDay is before/less than birthDay
    if (days < 0) {
      months--;
      int daysInPreviousMonth = DateTime(
        secondDateTime.year,
        secondDateTime.month,
        0,
      ).day;
      days += daysInPreviousMonth;
    }

    // if currentMonth is before/less than birthDay
    if (months < 0) {
      // the duration is not equal or greater than year thus decrement year by 1 and increase months by 12
      years--;
      months += 12;
    }
    Duration difference = secondDateTime.difference(firstDateTime);
    inYears = years;
    inMonths = months + (years * 12);
    inDays = difference.inDays;
    inWeeks = (inDays / 7).floor();
    inHours = (inDays * 24);
    inMinutes = inHours * 60;
    inSeconds = inMinutes * 60;
  }
}

///  Class used for getting age beween birth and current date
class Age {
  /// Birth Date
  final DateTime birthDateTime;

  /// Current Date
  final DateTime currentDateTime;

  /// Age in years
  int inYears = 0;

  /// Age in months
  int inMonths = 0;

  /// Age in weeks
  int inWeeks = 0;

  /// Age in days(when week is not considered)
  int inDays = 0;

  /// Age in days remaining after week is considered/count
  int inRemainingDays = 0;

  /// Current Year
  int get currentYear => currentDateTime.year;

  /// Birth Year
  int get birthYear => birthDateTime.year;

  /// Current Month
  int get currentMonth => currentDateTime.month;

  /// Stores duration between two dates in a String format
  String duration = '';

  /// Constructor of Age class with two required parameters
  Age({required this.birthDateTime, required this.currentDateTime}) {
    duration = calculateDuration(
      (currentYear - birthYear),
      duration,
      currentDateTime,
      birthDateTime,
    );
    // print("duration $duration");
    List<String> parts = duration.trim().split(' ');
    List<int> durationList = parts
        .map((value) => int.tryParse(value) ?? 0)
        .toList();

    inYears = durationList[0];
    inMonths = durationList[1];
    inWeeks = durationList[2];
    inRemainingDays = durationList[3];
    inDays = durationList[4];
  }
}

///  Class used for getting duration till next birthday
class NextBirthDay {
  /// Birth Date
  final DateTime birthDateTime;

  /// Current Date
  final DateTime currentDateTime;

  /// Months left until the next birthday
  int inMonths = 0;

  /// days left until the next birthday
  int inDays = 0;

  /// Birth Day
  int get birthDay => birthDateTime.day;

  /// Birth Month
  int get birthMonth => birthDateTime.month;

  /// Constructor of NextBirthDay class with two required parameters
  NextBirthDay({required this.birthDateTime, required this.currentDateTime}) {
    int nextBirthYear = currentDateTime.year;

    DateTime nextBirthDate = DateTime(nextBirthYear, birthMonth, birthDay);

    if (nextBirthDate.isBefore(currentDateTime)) {
      nextBirthYear++;
      nextBirthDate = DateTime(nextBirthYear, birthMonth, birthDay);
    }

    int months = nextBirthDate.month - currentDateTime.month;

    int days = nextBirthDate.day - currentDateTime.day;

    if (days < 0) {
      months--;
      int daysInPrevMonth = DateTime(
        nextBirthDate.year,
        nextBirthDate.month,
        0,
      ).day;

      days += daysInPrevMonth;
    }

    if (months < 0) {
      months += 12;
    }

    inMonths = months;
    inDays = days;

    // if birthday and birthmonth is the same as currentday and currentmonth
    if (inMonths == 0 && inDays == inMonths) {
      inMonths = 12;
      inDays = 0;
    }
  }
}
