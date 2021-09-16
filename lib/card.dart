import 'dart:async';

import 'package:flutter/material.dart';

class DemoCard extends StatefulWidget {
  DemoCard({Key? key}) : super(key: key);

  @override
  _DemoCardState createState() => _DemoCardState();
}

class _DemoCardState extends State<DemoCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Demo'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Card(
          elevation: 20,
          color: Colors.amber[100],
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.place),
                  title: Text('Ha Long Bay'),
                  subtitle: Text('Halong Bay is a UNESCO World Heritage Site and a popular tourist destination'),
                ),
                Container(
                  alignment: Alignment.center,
                  child: FutureBuilder<Widget>(
                    future: getImage(),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        return snapshot.data!;
                      }
                      return Text("loading...");
                    }),
                  ),
                )
              ],
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          // borderOnForeground: false,
          shadowColor: Colors.blueGrey,
        )
      )
    );
  }

  Future<Widget> getImage() async {
    final Completer<Widget> _completer = Completer();
    final url = 'https://i.ytimg.com/vi/fAS29vl-RPY/maxresdefault.jpg';
    final image = NetworkImage(url);
    final loadImage = image.resolve(const ImageConfiguration());

    // Delay 1s.
    await Future.delayed(Duration(seconds: 1));

    final listener = ImageStreamListener((ImageInfo info, isSync) async {
      _completer.complete(
        Container(
          margin: EdgeInsets.all(20),
          child: Image(image: image)
        )
      );
    });

    loadImage.addListener(listener);
    
    return _completer.future;
  }
}