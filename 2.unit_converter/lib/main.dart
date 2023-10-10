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
