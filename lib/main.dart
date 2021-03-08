import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  double _numberFrom;
  String _startMeasure;
  var fruits = ['Orange', 'Apple', 'Strawberry', 'Banana'];
  final List<String> _measures = [
    'meters',
    'kilometers',
    'grams',
    'kilograms',
    'feet',
    'miles',
    'pounds (lbs)',
    'ounces',
  ];
  @override
  void initState() {
    _numberFrom = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Measures Converter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Measures Converter'),
        ),
        body: Center(
          child: Column(
            children: [
              DropdownButton(
                value: _startMeasure,
                items: _measures.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _startMeasure = value;
                  });
                },
              ),
              TextField(
                onChanged: (text) {
                  var rv = double.tryParse(text);
                  // print(rv);
                  if (rv != null) {
                    setState(() {
                      _numberFrom = rv;
                      print(_numberFrom);
                    });
                  }
                },
              ),
              Text((_numberFrom == null) ? "" : _numberFrom.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
