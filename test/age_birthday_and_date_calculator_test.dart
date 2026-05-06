import 'package:flutter_test/flutter_test.dart';
import 'package:age_birthday_and_date_calculator/age_birthday_and_date_calculator.dart';

void main() {
  DateTime birthDateTime = DateTime(2010, 09, 16);
  DateTime currentDateTime = DateTime.now();

  test('Calculate Age', () {
    Age age = Age(
      birthDateTime: birthDateTime,
      currentDateTime: currentDateTime,
    );
    expect(age.inYears, 15);
    expect(age.inMonths, 7);
    expect(age.inDays, 20);
    expect(age.inWeeks, 2);
    expect(age.inRemainingDays, 6);
  });

  test('Calculate Date', () {
    DateCalculate date = DateCalculate(
      firstDateTime: birthDateTime,
      secondDateTime: currentDateTime,
    );
    expect(date.inYears, 15);
    expect(date.inMonths, 187);
    expect(date.inDays, 5711);
    expect(date.inWeeks, 815);
    expect(date.inHours, 137064);
    expect(date.inMinutes, 8223840);
  });

  test('Calculate Next Birthday', () {
    NextBirthDay nextBirthDay = NextBirthDay(
      birthDateTime: birthDateTime,
      currentDateTime: currentDateTime,
    );
    expect(nextBirthDay.inMonths, 4);
    expect(nextBirthDay.inDays, 10);
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
