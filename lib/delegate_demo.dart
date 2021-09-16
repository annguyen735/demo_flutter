import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  _onTapButton() {
    print("your event here");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChildPage(
        onTapBtn: _onTapButton,
      ),
    );
  }
}

class ChildPage extends StatelessWidget {
  final VoidCallback onTapBtn;

  const ChildPage({Key? key, required this.onTapBtn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text("Click Me"),
        onPressed: () {
          //call to your callback  here
          onTapBtn();
        },
      ),
    );
  }
} 