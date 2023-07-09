import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(DumbApp());
}

class DumbApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Are You Dumb?',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DumbHomePage(),
    );
  }
}

class DumbHomePage extends StatefulWidget {
  @override
  _DumbHomePageState createState() => _DumbHomePageState();
}

class _DumbHomePageState extends State<DumbHomePage> {
  double _noButtonPositionX = 0;
  double _noButtonPositionY = 0;
  Random _random = Random();

  void _swapButtons() {
    setState(() {
      _noButtonPositionX = _random.nextDouble() * (MediaQuery.of(context).size.width - 100);
      _noButtonPositionY = _random.nextDouble() * (MediaQuery.of(context).size.height - 200);
    });
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('I Knew That'),
          content: Text('You clicked Yes!'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Are You Dumb?'),
      ),
      body: Stack(
        children: [
          Positioned(
            top: _noButtonPositionY,
            left: _noButtonPositionX,
            child: ElevatedButton(
              onPressed: () {
                _swapButtons();
              },
              child: Text('No'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                _showDialog();
              },
              child: Text('Yes'),
            ),
          ),
        ],
      ),
    );
  }
}
