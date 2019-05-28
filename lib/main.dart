import 'package:flutter/material.dart';
import 'package:flutter_tax_calculator_app/screens/tax_calculator_input_screens.dart';

void main() => runApp(MyCalculatorApp());

class MyCalculatorApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'NoteKeeper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.deepPurple
      ),
      home: TaxcalculatorInputScreen(),
    );
  }
}
