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
  String? _startMeasure;
  String? _convertedMeasure;

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
    final TextStyle inputStyle = TextStyle(
      fontSize: 20,
      color: Colors.blue[900],
    );

    final TextStyle labelStyle = TextStyle(
      fontSize: 24,
      color: Colors.grey[700],
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Measures Converter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Measures Converter'),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Spacer(),
                Text(
                  'Value',
                  style: labelStyle,
                ),
                const Spacer(),
                TextField(
                  keyboardType: const TextInputType.numberWithOptions(
                      signed: false, decimal: true),
                  style: inputStyle,
                  decoration: const InputDecoration(
                    hintText: "Please insert the measure to be converted",
                  ),
                  onChanged: (text) {
                    var rv = double.tryParse(text);
                    if (rv != null) {
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
                const Spacer(),
                Text(
                  'From',
                  style: labelStyle,
                ),
                DropdownButton(
                  style: inputStyle,
                  isExpanded: true,
                  items: _measures.map((String value) {
                    return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: inputStyle,
                        ));
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _startMeasure = value;
                    });
                  },
                  value: _startMeasure,
                ),
                const Spacer(),
                Text(
                  'To',
                  style: labelStyle,
                ),
                const Spacer(),
                DropdownButton(
                  style: inputStyle,
                  isExpanded: true,
                  items: _measures.map((String value) {
                    return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: inputStyle,
                        ));
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _convertedMeasure = value;
                    });
                  },
                  value: _convertedMeasure,
                ),
                const Spacer(
                  flex: 2,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      elevation: const MaterialStatePropertyAll(4),
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.grey[300])),
                  child: Text(
                    'Convert',
                    style: inputStyle,
                  ),
                  onPressed: () => true,
                ),
                const Spacer(
                  flex: 2,
                ),
                Text(
                  (_numberFrom == null) ? '' : _numberFrom.toString(),
                  style: inputStyle,
                ),
                const Spacer(
                  flex: 8,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
