import 'package:flutter/material.dart';

class DemoRow extends StatelessWidget {
  const DemoRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          verticalDirection: VerticalDirection.down,
          children: <Widget> [
            ElevatedButton(child: Text("BTN 1"), onPressed:(){}),
            Expanded(
              flex: 1,
              child: Icon(Icons.ac_unit, size: 64, color: Colors.blue),
            ),
            ElevatedButton(
                child: Text("Button 2"),
                onPressed:(){},
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size.square(100))
                )
            ),
            Spacer(
              flex: 1
            ),
            ElevatedButton(child: Text("BTN 3"), onPressed:(){}),
          ],
        ),
      ),
    );
  }
}