import 'package:calculator_app/component/my_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var userInput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            'Calculator App',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          backgroundColor: Colors.orange,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            userInput.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 40),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          answer.toString(),
                          style: TextStyle(color: Colors.orange, fontSize: 40),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          height: 2,
                          color: Colors.grey,
                          thickness: 2,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          MyButton(
                            title: 'AC',
                            onpress: () {
                              userInput = '';
                              answer = '';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '+/-',
                            onpress: () {
                              userInput += '+/-';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '%',
                            onpress: () {
                              userInput += '%';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '/',
                            color: Colors.orange,
                            onpress: () {
                              userInput += '/';
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                            title: '1',
                            onpress: () {
                              userInput += '1';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '2',
                            onpress: () {
                              userInput += '2';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '3',
                            onpress: () {
                              userInput += '3';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: 'x',
                            color: Colors.orange,
                            onpress: () {
                              userInput += 'x';
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                            title: '4',
                            onpress: () {
                              userInput += '4';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '5',
                            onpress: () {
                              userInput += '5';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '6',
                            onpress: () {
                              userInput += '6';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '-',
                            color: Colors.orange,
                            onpress: () {
                              userInput += '-';
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                            title: '1',
                            onpress: () {
                              userInput += '1';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '2',
                            onpress: () {
                              userInput += '2';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '3',
                            onpress: () {
                              userInput += '3';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '+',
                            color: Colors.orange,
                            onpress: () {
                              userInput += '+';
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                            title: '0',
                            onpress: () {
                              userInput += '0';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '.',
                            onpress: () {
                              userInput += '.';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: 'DEL',
                            onpress: () {
                              userInput =
                                  userInput.substring(0, userInput.length - 1);
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '=',
                            color: Colors.orange,
                            onpress: () {
                              equalPres();
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void equalPres() {
    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
