import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Center(
        child: CounterText(),
      ),
    );
  }
}

class CounterText extends StatefulWidget {
  @override
  _CounterTextState createState() => _CounterTextState();
}

class _CounterTextState extends State<CounterText> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Count = $_count'),
        ElevatedButton.icon(
          onPressed: () {
            setState(() {
              _count++;
            });
          },
          icon: Icon(Icons.add),
          label: Text('add'),
        ),
      ],
    );
  }
}
