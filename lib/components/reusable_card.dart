import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final int value;
  final Color titleColor;
  final Color iconColor;
  final String tag;
  final Color cardColor;

  ReusableCard(
      {@required this.icon,
      @required this.cardColor,
      @required this.title,
      @required this.iconColor,
      @required this.value,
      @required this.titleColor,
      @required this.tag});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Card(
        color: cardColor,
        margin: EdgeInsets.symmetric(vertical: 9, horizontal: 8),
        elevation: 16,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding:
              const EdgeInsets.only(right: 20, top: 13, left: 3, bottom: 5),
          child: ListTile(
            title: Text(
              title.toUpperCase(),
              style: TextStyle(
                  color: titleColor, fontSize: 17, fontWeight: FontWeight.bold),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 10, left: 0),
              child: Text(
                value.toString(),
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[800]),
              ),
            ),
            trailing: Icon(
              icon,
              color: iconColor,
              size: 50,
            ),
          ),
        ),
      ),
    );
  }
}
