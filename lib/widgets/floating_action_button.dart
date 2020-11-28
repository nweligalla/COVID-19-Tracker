import 'package:flutter/material.dart';

class FloatingActionBtn extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final Function onPressed;

  FloatingActionBtn({
    @required this.icon,
    @required this.onPressed,
    this.color,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(
        icon,
        size: 30,
      ),
      backgroundColor: color,
      elevation: 0,
      onPressed: onPressed,
    );
  }
}
