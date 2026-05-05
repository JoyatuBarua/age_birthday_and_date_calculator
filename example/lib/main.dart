import 'package:age_birthday_and_date_calculator/age_birthday_and_date_calculator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Age Date Birthday Calculator'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime currentDate = DateTime.now();
  DateTime birthDate = DateTime(1991, 12, 07);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final double ageCardWidth = deviceWidth * .92;
    final double ageCardHeight = 350;

    Age age = Age(birthDateTime: birthDate, currentDateTime: currentDate);
    NextBirthDay nextBirthDay = NextBirthDay(
      birthDateTime: birthDate,
      currentDateTime: currentDate,
    );
    DateCalculate dateCalculate = DateCalculate(
      firstDateTime: birthDate,
      secondDateTime: currentDate,
    );
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 115, 34),

        title: Center(
          child: Text(
            widget.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: .bold,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .start,
          children: [
            SizedBox(height: 10),
            Container(
              padding: .all(10),
              width: ageCardWidth,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(35, 35, 35, 155),
                    Color.fromRGBO(35, 35, 35, 15),
                  ],
                ),

                border: BoxBorder.all(
                  color: const Color.fromRGBO(199, 199, 199, 1),
                  width: 0.5,
                ),
                borderRadius: .circular(15),
              ),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    "Date of Birth: ",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  Text(
                    "${birthDate.year} - ${birthDate.month} - ${birthDate.day}",
                    style: TextStyle(
                      fontSize: 18,
                      color: const Color.fromARGB(255, 255, 115, 34),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Container(
              padding: .all(10),
              width: ageCardWidth,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(35, 35, 35, 155),
                    Color.fromRGBO(35, 35, 35, 15),
                  ],
                ),

                // color: Color.fromRGBO(35, 35, 35, 155),
                border: BoxBorder.all(
                  color: const Color.fromRGBO(199, 199, 199, 1),
                  width: 0.5,
                ),
                borderRadius: .circular(15),
              ),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    "Current Date: ",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  Text(
                    "${currentDate.year} - ${currentDate.month} - ${currentDate.day}",
                    style: TextStyle(
                      fontSize: 18,
                      color: const Color.fromARGB(255, 255, 115, 34),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(35, 35, 35, 155),
                    Color.fromRGBO(35, 35, 35, 15),
                  ],
                ),

                // color: Color.fromRGBO(35, 35, 35, 155),
                border: BoxBorder.all(
                  color: const Color.fromRGBO(199, 199, 199, 1),
                  width: 0.5,
                ),
                borderRadius: .circular(15),
              ),

              width: ageCardWidth,
              height: ageCardHeight,
              child: Column(
                mainAxisAlignment: .start,
                crossAxisAlignment: .center,
                children: [
                  SizedBox(height: 10),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: .spaceEvenly,

                      children: [
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: .start,
                            children: [
                              Text(
                                "Age",
                                style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.white,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    age.inYears.toString(),
                                    style: TextStyle(
                                      fontSize: 45,
                                      color: const Color.fromARGB(
                                        255,
                                        255,
                                        115,
                                        34,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "years",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),

                              Text(
                                "${age.inMonths} months | ${age.inDays} days",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          width: 2,
                          height: ageCardHeight * .45,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(114, 116, 129, 90),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 1,
                                blurRadius: 9,
                                offset: Offset(0, 3),
                                blurStyle: .normal,
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          child: Column(
                            crossAxisAlignment: .center,
                            children: [
                              Text(
                                "Next Birthday",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 255, 115, 34),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: const Color.fromARGB(
                                    255,
                                    255,
                                    115,
                                    34,
                                  ),
                                  child: Icon(
                                    Icons.cake_sharp,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ),

                              Text(
                                "${nextBirthDay.inMonths} months | ${nextBirthDay.inDays} days",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: ageCardWidth * .95,
                    height: 2,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(114, 116, 129, 90),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 1,
                          blurRadius: 9,
                          offset: Offset(0, 3),
                          blurStyle: .normal,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Details",
                    style: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(255, 255, 115, 34),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: .spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: .center,
                        children: [
                          Text(
                            "Years",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          Text(
                            dateCalculate.inYears.toString(),
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Days",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          Text(
                            dateCalculate.inDays.toString(),
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: .center,
                        children: [
                          Text(
                            "Months",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          Text(
                            dateCalculate.inMonths.toString(),
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Hours",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          Text(
                            dateCalculate.inHours.toString(),
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: .center,
                        children: [
                          Text(
                            "Weeks",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          Text(
                            dateCalculate.inWeeks.toString(),
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Minutes",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          Text(
                            dateCalculate.inMinutes.toString(),
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
