import 'package:flutter_test/flutter_test.dart';
import 'package:age_birthday_and_date_calculator/age_birthday_and_date_calculator.dart';

void main() {
  DateTime birthDateTime = DateTime(2010, 09, 16);
  DateTime currentDateTime = DateTime(2026, 09, 26);

  DateTime birthDateTime1 = DateTime(2026, 08, 01);
  DateTime currentDateTime1 = DateTime(2026, 09, 26);

  test('Calculate Age', () {
    Age age = Age(
      birthDateTime: birthDateTime,
      currentDateTime: currentDateTime,
    );
    expect(age.inYears, 16);
    expect(age.inMonths, 0);
    expect(age.inDays, 10);
    expect(age.inWeeks, 1);
    expect(age.inRemainingDays, 3);
  });

  test('Calculate Age', () {
    Age age = Age(
      birthDateTime: birthDateTime1,
      currentDateTime: currentDateTime1,
    );
    expect(age.inYears, 0);
    expect(age.inMonths, 1);
    expect(age.inDays, 25);
    expect(age.inWeeks, 3);
    expect(age.inRemainingDays, 4);
  });

  test('Calculate Date', () {
    DateCalculate date = DateCalculate(
      firstDateTime: birthDateTime,
      secondDateTime: currentDateTime,
    );
    expect(date.inYears, 16);
    expect(date.inMonths, 192);
    expect(date.inDays, 5854);
    expect(date.inWeeks, 836);
    expect(date.inHours, 140496);
    expect(date.inMinutes, 8429760);
  });

  test('Calculate Next Birthday', () {
    NextBirthDay nextBirthDay = NextBirthDay(
      birthDateTime: birthDateTime,
      currentDateTime: currentDateTime,
    );
    expect(nextBirthDay.inMonths, 11);
    expect(nextBirthDay.inDays, 21);
  });

  test('Calculate Next Birthday', () {
    NextBirthDay nextBirthDay = NextBirthDay(
      birthDateTime: currentDateTime,
      currentDateTime: currentDateTime,
    );
    expect(nextBirthDay.inMonths, 12);
    expect(nextBirthDay.inDays, 0);
  });
}
