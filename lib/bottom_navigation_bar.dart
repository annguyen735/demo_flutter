import 'package:flutter/material.dart';

class DemoBottomNavigationBar extends StatefulWidget {
  DemoBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _DemoBottomNavigationBarState createState() => _DemoBottomNavigationBarState();
}

class _DemoBottomNavigationBarState extends State<DemoBottomNavigationBar> {
  int selectedIndex = 0;
  Widget _myContacts = MyContacts();
  Widget _myEmails = MyEmails();
  Widget _myProfile = MyProfile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomNavigationBar Example'),
      ),
      body: this.getBody(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
          opacity: 1
        ),
        unselectedIconTheme: IconThemeData(
          color: Colors.black45,
          opacity: 0.5
        ),
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor
        ),
        currentIndex: selectedIndex,
        items: <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: "Contact"
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: "Emails",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          )
        ],
        onTap: (int index) => onTapHandler(index),
      ),
    );
  }

  Widget getBody( )  {
    if(this.selectedIndex == 0) {
      return this._myContacts;
    } else if(this.selectedIndex==1) {
      return this._myEmails;
    } else {
      return this._myProfile;
    }
  }
 
  void onTapHandler(int index)  {
    this.setState(() {
      this.selectedIndex = index;
    });
  }
}

class MyContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Contacts"));
  }
}
 
class MyEmails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Emails"));
  }
}
 
class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Profile"));
  }
}