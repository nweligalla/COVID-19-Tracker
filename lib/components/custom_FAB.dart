import 'package:flutter/material.dart';

class CustomFAB extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final Function onPressed;

  CustomFAB(
      {@required this.icon, @required this.onPressed, this.color, this.label});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      label: Text(
        label,
        style: TextStyle(fontFamily: "Muli", fontSize: 16),
      ),
      icon: Icon(
        icon,
        size: 30,
      ),
      backgroundColor: color,
      elevation: 0,
      onPressed: onPressed,
    );
  }
}
