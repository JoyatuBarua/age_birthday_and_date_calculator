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
    durationInDays += daysInPrevMonth;
  }

  // if currentMonth is before/less than birthMonth
  if (durationInMonths < 0) {
    // the duration is not equal or greater than year thus decrement year by 1 and increase months by 12
    durationInYears--;
    durationInMonths += 12;
  }

  Duration difference = currentDateTime.difference(birthDateTime);

  int weeks = (durationInDays / 7).floor();
  int remainingDays = durationInDays % 7;

  // print(
  //   'duration in days $durationInDays remaining weeks $weeks remaining days $remainingDays',
  // );

  int totalHours = difference.inHours;
  int totalMinutes = difference.inMinutes;
  int totalSeconds = difference.inSeconds;

  return "$durationInYears $durationInMonths $weeks $remainingDays $durationInDays $totalHours $totalMinutes $totalSeconds";
}

String calculateMonthWeekRemainingdayDayHourMinuteSecondsForSameYears(
  DateTime birthDateTime,
  DateTime currentDateTime,
) {
  int durationInMonths = currentDateTime.month - birthDateTime.month;
  int durationInDays = currentDateTime.day - birthDateTime.day;

  // if currentDay is before/less than birthDay
  if (durationInDays < 0) {
    //
    durationInMonths--;
    int daysInPrevMonth = DateTime(
      currentDateTime.year,
      currentDateTime.month,
      0,
    ).day;
    durationInDays += daysInPrevMonth;
  }

  Duration totalDuration = currentDateTime.difference(birthDateTime);
  // int totalDays = totalDuration.inDays;
  int weeks = (durationInDays / 7).floor();
  int remainingDays = durationInDays % 7;

  int totalHours = totalDuration.inHours;
  int totalMinutes = totalDuration.inMinutes;
  int totalSeconds = totalDuration.inSeconds;

  // print('total days $totalDays remaining days $remainingDays');

  return "$durationInMonths $weeks $durationInDays $remainingDays $totalHours $totalMinutes $totalSeconds";
}

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
          calculateMonthWeekRemainingdayDayHourMinuteSecondsForSameYears(
            birthDateTime,
            currentDateTime,
          );

      age = '$yearDifference $monthWeekDayHourMinuteSeconds';
      return age;
    }

    String monthWeekRemainingdayDayHourMinuteSeconds =
        calculateMonthWeekRemainingdayDayHourMinuteSecondsForSameYears(
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

class DateCalculate {
  DateTime firstDateTime;
  DateTime secondDateTime;

  int inYears = 0;
  int inMonths = 0;
  int inWeeks = 0;
  int inDays = 0;
  int inHours = 0;
  int inMinutes = 0;
  int inSeconds = 0;

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

class Age {
  final DateTime birthDateTime;
  final DateTime currentDateTime;
  int inYears = 0;
  int inMonths = 0;
  int inWeeks = 0;
  int inDays = 0;
  int inRemainingDays = 0;

  int get currentYear => currentDateTime.year;
  int get birthYear => birthDateTime.year;
  int get currentMonth => currentDateTime.month;

  String duration = '';
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

class NextBirthDay {
  final DateTime birthDateTime;
  final DateTime currentDateTime;

  int inMonths = 0;
  int inDays = 0;
  int get birthDay => birthDateTime.day;
  int get birthMonth => birthDateTime.month;

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
    if (currentDateTime == birthDateTime) {
      inMonths = 12;
      inDays = 0;
    }
  }
}
