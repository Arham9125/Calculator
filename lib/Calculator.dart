import 'package:calculator/mainwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:math_expressions/math_expressions.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  var questions = "";
  var ans = "";
  var onclicked = 0;
  final List<String> number = [
    "C",
    "DEL",
    "%",
    "/",
    "9",
    "8",
    "7",
    "+",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "*",
    "0",
    ".",
    "ANS",
    "=",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade300,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        questions,
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        ans,
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  alignment: Alignment.topCenter,
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4),
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Buttons(
                            buttoncolor: Colors.green.shade600,
                            buttontext: number[index],
                            buttontxtclr: Colors.white,
                            buttonpress: () {
                              setState(() {
                                questions = "";
                                ans = "";
                              });
                            },
                          );
                        } else if (index == 2) {
                          return Buttons(
                            buttoncolor: Colors.green.shade600,
                            buttontext: number[index],
                            buttontxtclr: Colors.white,
                            buttonpress: () {
                              setState(() {
                                hundered();
                              });
                            },
                          );
                        } else if (index == 1) {
                          return Buttons(
                            buttoncolor: Colors.red,
                            buttontext: number[index],
                            buttontxtclr: Colors.white,
                            buttonpress: () {
                              setState(() {
                                questions = questions.substring(
                                    0, questions.length - 1);
                              });
                            },
                          );
                        } else if (index == number.length - 1) {
                          return Buttons(
                            buttoncolor: Colors.purple.shade900,
                            buttontext: number[index],
                            buttontxtclr: Colors.white,
                            buttonpress: () {
                              setState(() {
                                equalfunc();
                              });
                            },
                          );
                        } else {
                          return Buttons(
                            buttoncolor: isOperator(number[index])
                                ? Colors.purple.shade900
                                : Colors.purple.shade500,
                            buttontext: number[index],
                            buttontxtclr: Colors.white,
                            buttonpress: () {
                              setState(() {
                                questions += number[index];
                              });
                            },
                          );
                        }
                      })),
            ),
          )
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == "+" || x == "-" || x == "*" || x == "/" || x == "=" || x == "%") {
      return true;
    } else {
      return false;
    }
  }

  equalfunc() {
    final String fquestion = questions;
    Parser p = Parser();
    Expression exp = p.parse(fquestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    ans = eval.toString();
  }

  hundered() {
    questions = questions * 10;
  }
}
