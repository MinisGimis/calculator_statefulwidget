import 'dart:ffi';

import 'package:flutter/material.dart';

const RESULT_COLOUR = Color(0xFFF8F8F8);
const BACKGROUND_COLOUR = Color(0xFFFFFFFF);

//

double addDigit(double number, int newDigit) => (number * 10) + newDigit;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double displayNum = 0.0;
  double n1 = 0.0;
  bool clearAnswer = false;
  String operation = "";
  
  List buttonText = [1, 2, 3, "x", 4, 5, 6, "÷", 7, 8, 9, "-", "", 0, "=", "+"];


  //CALCULATOR LOGIC
  //clicking on numbers adds the digit to the end of the number
  //immediately after an operation (x / + - =), clicking on a number starts with a new number
  //pressing on = performs the last operation again
  //pressing on x / + - multiple times in a row doesn't do anything
  //x / + - also performs the last operation

  void equals() {

    double first = clearAnswer ? displayNum : n1;
    double second = clearAnswer ? n1 : displayNum;
    print("$operation, $first, $second, $clearAnswer, display: $displayNum, n1: $n1");

    switch(operation) {

      case "x":
        displayNum = first * second;
        break;

      case "÷":
        displayNum = first / second;
        break;

      case "+":
        displayNum = first + second;
        break;

      case "-":
        displayNum = first - second;
        break;

      default:
        break;
    }
    n1 = second;
  }

  void operationPressed(int buttonIndex) {


    switch(buttonText[buttonIndex]) {

      case "":
        print("clear");
        displayNum = 0.0;
        n1 = 0.0;
        operation = "";
        clearAnswer = false;
        break;

      case "=":
        equals();
        break;

      default:
        if (!clearAnswer && operation != "") {
          equals();
        }
        operation = buttonText[buttonIndex];
        break;
    }
    clearAnswer = true;
  }

  void digitPressed(int buttonIndex) {
    if (clearAnswer) {
      n1 = displayNum;
      displayNum = 0.0;
      clearAnswer = false;
    }
    if (displayNum < 1000000000) {
      displayNum = addDigit(displayNum, buttonText[buttonIndex]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 168,
          color: RESULT_COLOUR,
          width: double.infinity,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20, right: 42),
              child: Text(displayNum.toInt().toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 50,
                  fontWeight: FontWeight.w700,
                )
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: BACKGROUND_COLOUR,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 16,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return TextButton(
                  onPressed: () {
                    setState(() {
                      print(buttonText[index]);
                      if (buttonText[index] is int) {
                        digitPressed(index);
                      }
                      else {
                        operationPressed(index);
                      }
                    });
                  },
                  child: Center(
                    child: Text(
                      buttonText[index].toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 37,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
