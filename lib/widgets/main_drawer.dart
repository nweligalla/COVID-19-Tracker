import 'package:flutter/material.dart';
import '../screens/faq_screen.dart';
import '../screens/call_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text("Header"),
            decoration: BoxDecoration(color: Colors.blueGrey),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: DrawItem(
              icon: Icons.phone,
              text: "Emergency Contacts",
              onTap: () {
                Navigator.of(context).popAndPushNamed(CallScreen.id);
              },
            ),
          ),
          DrawItem(
            icon: Icons.question_answer,
            text: "FAQ",
            onTap: () {
              Navigator.of(context).popAndPushNamed(FAQScreen.id);
            },
          ),
        ],
      ),
    );
  }
}

class DrawItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;

  DrawItem({@required this.icon, @required this.text, @required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.blueGrey,
      onTap: onTap,
      child: Container(
        height: 35,
        margin: EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Icon(
                icon,
                size: 35,
                color: Colors.grey[850],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF424242),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
