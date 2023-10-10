import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late double _numberFrom;

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
      debugShowCheckedModeBanner: false,
      title: 'Measures Converter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Measures Converter'),
        ),
        body: Center(
          child: Column(
            children: [
              DropdownButton(
                  items: _measures.map((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                  onChanged: (_) {}),
              TextField(
                onChanged: (text) {
                  var rv = double.tryParse(text);
                  if (rv != null && text.isNotEmpty) {
                    setState(() {
                      _numberFrom = rv;
                    });
                  } else if (text.isEmpty) {
                    setState(() {
                      _numberFrom = 0;
                    });
                  }
                },
              ),
              Text(
                (_numberFrom == null) ? '' : _numberFrom.toString(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
