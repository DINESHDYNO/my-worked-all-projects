import 'package:calcu/buttons.dart';
import 'package:calcu/history.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const one());
}

class one extends StatelessWidget {
  const one({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: two(),
      color: Colors.green,
    );
  }
}

class two extends StatefulWidget {
  const two({super.key});

  @override
  State<two> createState() => _twoState();
}

class _twoState extends State<two> {
  var userQuestions = '';
  var userAnswer = '';
  final List<String> buttons = [
    'C',
    '⌫',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    '+/-',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.calculate,
          size: 30,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => histroy()));
              },
              icon: Icon(
                Icons.history,
                size: 30,
              ))
        ],
        title: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            "Calculator",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.deepPurple,
        elevation: 20,
      ),
      backgroundColor: Colors.deepPurple[200],
      body: Column(
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.all(20),
                    child: Text(
                      userQuestions,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Color(0x8A000000)),
                    )),
                Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(userAnswer,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.black)))
              ],
            ),
          ),
          Expanded(
              flex: 3,
              child: Container(
                child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return mybuttons(
                          buttonTapped: () {
                            setState(() {
                              userQuestions = '';
                              userAnswer = '';
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.green,
                          textColor: Colors.white,
                        );
                      } else if (index == 1) {
                        return mybuttons(
                          buttonTapped: () {
                            setState(() {
                              userQuestions = userQuestions.substring(
                                  0, userQuestions.length - 1);
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.red,
                          textColor: Colors.white,
                        );
                      } else if (index == buttons.length - 1) {
                        return mybuttons(
                          buttonTapped: () {
                            setState(() {
                              equalpressed();
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.deepPurple,
                          textColor: Colors.white,
                        );
                      } else if (index == buttons.length - 2) {
                        return mybuttons(
                          buttonTapped: () {
                            setState(() {
                              if (userQuestions.isNotEmpty) {
                                isNegative = !isNegative;
                                if (isNegative) {
                                  userQuestions = '-' + userQuestions;
                                } else {
                                  userQuestions =
                                      userQuestions.replaceFirst('-', '');
                                }
                              }
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.deepPurple[50],
                          textColor: Colors.deepPurple,
                        );
                      } else {
                        return mybuttons(
                          buttonTapped: () {
                            setState(() {
                              userQuestions = userQuestions + buttons[index];
                            });
                          },
                          buttonText: buttons[index],
                          color: isOPerator(buttons[index])
                              ? Colors.deepPurple
                              : Colors.deepPurple[50],
                          textColor: isOPerator(buttons[index])
                              ? Colors.white
                              : Colors.deepPurple,
                        );
                      }
                    }),
              ))
        ],
      ),
    );
  }

  bool isNegative = false;
  bool isPercentage = false;

  bool isOPerator(String x) {
    if (x == '%' ||
        x == '/' ||
        x == 'x' ||
        x == '-' ||
        x == '+' ||
        x == '=' ||
        x == '+/-') {
      return true;
    }
    return false;
  }

  void equalpressed() {
    String finalQuestion = userQuestions;
    finalQuestion = finalQuestion.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = eval.toString();
    try {
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      userAnswer = eval.toString();

      if (eval.isInfinite || eval.isNaN) {
        userAnswer = "Error";
      } else {
        userAnswer = eval.toString();
      }
    } catch (e) {
      userAnswer = "Error";
    }
  }
}
