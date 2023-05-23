import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_app/calculator_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? savedState = prefs.getString('calculatorState');
  CalculatorModel calculatorModel = CalculatorModel(
    json: savedState != null ? jsonDecode(savedState) : null,
  );

  runApp(
    ChangeNotifierProvider(
      create: (context) => calculatorModel,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final String? savedState;
  const MyApp({Key? key, this.savedState}) : super(key: key);

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
      home: const SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          body: MyHomePage(),
        ),
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
  List buttonText = [1, 2, 3, "x", 4, 5, 6, "÷", 7, 8, 9, "-", "", 0, "=", "+"];

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
          height: 168,
          color: Theme.of(context).primaryColor,
          width: double.infinity,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20, right: 42),
              child: Text(
                context.select((CalculatorModel state) => state.showDecimal)
                    ? context.select((CalculatorModel state) => state.displayNum.toString())
                    : context.select((CalculatorModel state) => state.displayNum.toInt().toString()),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Column(
              children: buttonText.asMap().entries.map((entry) {
                int index = entry.key;
                if (index % 4 == 0) {
                  return Expanded(
                    child: Row(
                      children: buttonText.sublist(index, index + 4).map((item) {
                        return Expanded(
                          child: TextButton(
                            onPressed: () {
                              if (item is int) {
                                context.read<CalculatorModel>().addDigit(item);
                              } 
                              else {
                                switch (item) {
                                  case "":
                                    context.read<CalculatorModel>().reset();
                                    break;
                                  case "=":
                                    context.read<CalculatorModel>().calculateResult();
                                    break;
                                  default:
                                    context.read<CalculatorModel>().setOperation(item);
                                    break;
                                }
                              }
                            },
                            child: Center(
                              child: Text(
                                item.toString(),
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  );
                } 
                else {
                  return Container();
                }
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
