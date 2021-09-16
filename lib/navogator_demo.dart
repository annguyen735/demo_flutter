import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First'),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => SecondPage())
            ), 
            icon: Icon(Icons.album))
        ],
      ),
      body: Center(
        child: Container(
          child: Text('First Page'),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushReplacement(
              context, 
              MaterialPageRoute(builder: (context) => ThirdPage())
            ), 
            icon: Icon(Icons.album))
        ],
      ),
      body: Center(
        child: Container(
          child: Text('Second Page'),
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushAndRemoveUntil(
              context, 
              MaterialPageRoute(builder: (context) => SecondPage()),
              (route) => false
            ), 
            icon: Icon(Icons.album))
        ],
      ),
      body: Center(
        child: Container(
          child: Text('Third Page'),
        ),
      ),
    );
  }
}