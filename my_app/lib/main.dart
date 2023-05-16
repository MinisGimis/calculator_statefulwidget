import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/calculator_bloc/calculator_cubit.dart';

import './calculator_bloc/calculator_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => CalculatorCubit(),
      child: MaterialApp(
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
        )
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
              child: BlocBuilder<CalculatorCubit, CalculatorState>(
                builder: (context, state) {
                  return Text(state.showDecimal ? state.displayNum.toString() : state.displayNum.toInt().toString(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  );
                }
              )
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
                                context.read<CalculatorCubit>().addDigit(item);
                              } 
                              else {
                                switch (item) {
                                  case "":
                                    context.read<CalculatorCubit>().reset();
                                    break;
                                  case "=":
                                    context.read<CalculatorCubit>().calculateResult();
                                    break;
                                  default:
                                    context.read<CalculatorCubit>().setOperation(item);
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