import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: const Color(0xFFF8F8F8),
      theme: ThemeData(
        primaryColor: const Color(0xFFF8F8F8),
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontFamily: 'SF Mono',
            color: Colors.black,
            fontSize: 50,
            fontWeight: FontWeight.w700,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'SF Mono',
            color: Colors.black,
            fontSize: 37,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      home: const Scaffold(
        body: MyHomePage(),
      )
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

  double addDigit(double number, int newDigit) => (number * 10) + newDigit;

  void equals() {

    double first = clearAnswer ? displayNum : n1;
    double second = clearAnswer ? n1 : displayNum;

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

    return SafeArea(
      //top: false, //some reason removing top app bar breaks the layout for the buttons
      bottom: false,
      child: Column(
        children: [
          Container(
            height: 168,
            color: Theme.of(context).primaryColor,
            width: double.infinity,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20, right: 42),
                child: Text(displayNum.toInt().toString(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  double width = constraints.maxWidth;
                  double height = constraints.maxHeight;
                  double ratio = width / height;

                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 16,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: ratio,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return TextButton(
                        onPressed: () {
                          setState(() {
                            if (buttonText[index] is int) {
                              digitPressed(index);
                            } else {
                              operationPressed(index);
                            }
                          });
                        },
                        child: Center(
                          child: Text(
                            buttonText[index].toString(),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      )
    );
  }
}
