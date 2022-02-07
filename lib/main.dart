import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController? _controller;
  String? _reversed;
  int? _length;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('String computation'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter string",
              ),
            ),
            const SizedBox(height: 10.0),
            if (_reversed != null) ...[
              Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        'Reversed String',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        _reversed!,
                        style: const TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Length',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        _length.toString(),
                        style: const TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
            ],
            ElevatedButton(
              child: const Text("Compute"),
              onPressed: () {
                if (_controller!.text.isEmpty) return;
                setState(() {
                  _reversed = reverseString(_controller!.text);
                  _length = stringLength(_controller!.text);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

String reverseString(String initial) {
  return initial.split('').reversed.join();
}

int stringLength(String value) {
  return value.length;
}
