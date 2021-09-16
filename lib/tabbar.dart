import 'package:flutter/material.dart';

class DemoTabbar extends StatefulWidget {
  DemoTabbar({Key? key, required this.tabbarCount}) : super(key: key);
  final int tabbarCount;

  @override
  _DemoTabbarState createState() => _DemoTabbarState();
}

class _DemoTabbarState extends State<DemoTabbar> {
  Align createTabBar() {
    return Align(
      alignment: Alignment.centerLeft,
      child: TabBar(
          tabs: [
            // Container(
            //   child: Tab(
            //     text: "Car",
            //     icon: Icon(Icons.directions_car),
            //   ),
            //   width: 70,
            // ),
            // Container(
            //   child: Tab(
            //     text: "Transit",
            //     icon: Icon(Icons.directions_transit),
            //   ),
            //   width: 70,
            // ),
            // Tab(
            //   text: "Bike",
            //   icon: Icon(Icons.directions_bike),
            // ),
            // Tab(
            //   text: "Boat",
            //   icon: Icon(Icons.directions_boat),
            // ),
            // Tab(
            //   text: "Railway",
            //   icon: Icon(Icons.directions_railway),
            // ),
            // Tab(
            //   text: "Bus",
            //   icon: Icon(Icons.directions_bus),
            // ),
            Row (children: [Icon(Icons.directions_car), SizedBox(width:5), Text("Car")]),
            Row (children: [Icon(Icons.directions_transit), SizedBox(width:5), Text("Transit")]),
            Row (children: [Icon(Icons.directions_bike), SizedBox(width:5), Text("Bike")]),
            Row (children: [Icon(Icons.directions_boat), SizedBox(width:5), Text("Boat")]),
            Row (children: [Icon(Icons.directions_railway), SizedBox(width:5), Text("Railway")]),
            Row (children: [Icon(Icons.directions_bus), SizedBox(width:5), Text("Bus")]),
          ],
          isScrollable: true,
          // indicatorColor: Colors.redAccent,
          indicatorWeight: 3,
          // indicatorPadding: EdgeInsets.only(left: 15, right: 15),
          indicator: ShapeDecoration(
            shape: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
                // width: 100,
                style: BorderStyle.solid
              )
            ),
            gradient: LinearGradient(colors: [Color(0xff0081ff), Colors.yellowAccent, Colors.purpleAccent])
          ),
          labelColor: Colors.red[600],
          unselectedLabelColor: Colors.black,
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal, fontStyle: FontStyle.italic),
          labelPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          onTap: null,
          
          // mouseCursor: ,
        ),
    );
  }

  AlertDialog onTapHandler(int index) {
    String content = "";
    switch (index) {
      case 0:
        content = "Card";
        break;
      case 1:
        content = "Transit";
        break;
      case 2:
        content = "Bike";
        break;
      case 3:
        content = "Boat";
        break;
      case 4:
        content = "Railway";
        break;
      case 5:
        content = "Bus";
        break;
      default:
        content = "No one";
    }

    return AlertDialog(
      title: Text("Transportation"),
      content: Text(content),
      actions: <TextButton> [
        TextButton(
          onPressed: null, 
          child: Text('OK')
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.tabbarCount,
      // initialIndex: (widget.tabbarCount / 2).ceil() - 1,
      child: Scaffold(
          appBar: AppBar(
            title: Text("TabBar Example"),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(40),
              child: createTabBar(),
            )
          ),
          body: Center(
              child:  TabBarView(
                children: <Widget> [
                  Center(child: Text("Direction by Car")),
                  Center(child: Text("Direction by Transit")),
                  Center(child: Text("Direction by Bike")),
                  Center(child: Text("Direction by Boat")),
                  Center(child: Text("Direction by Railway")),
                  Center(child: Text("Direction by Bus"))
                ]
              )
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () { },
            tooltip: 'Increment',
            child: Icon(Icons.add),
            elevation: 2.0,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            child: new Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(icon: Icon(Icons.menu), onPressed: () {},),
                IconButton(icon: Icon(Icons.search), onPressed: () {},),
              ],
            ),
            shape: CircularNotchedRectangle(),
            color: Theme.of(context).primaryColor,
          )
      ),
    );
  }
}