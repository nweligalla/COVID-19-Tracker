import 'package:flutter/material.dart';

class ReusableMiniCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final int value;
  final Color titleColor;
  final Color iconColor;
  final String tag;
  final Color cardColor;

  ReusableMiniCard(
      {@required this.icon,
      @required this.cardColor,
      @required this.tag,
      @required this.title,
      @required this.value,
      @required this.titleColor,
      @required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Card(
        color: cardColor,
        margin: EdgeInsets.symmetric(vertical: 9, horizontal: 8),
        elevation: 16,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 20),
              child: Icon(
                icon,
                color: iconColor,
                size: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15),
              child: Text(
                title.toUpperCase(),
                style: TextStyle(
                    color: titleColor,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 7, left: 15),
              child: Text(
                value.toString(),
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[800]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
