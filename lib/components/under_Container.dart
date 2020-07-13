import 'package:flutter/material.dart';

class UnderContainer extends StatelessWidget {
  final Widget child;
  final String tag;
  final Color color;

  UnderContainer({this.color, this.child, this.tag});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Card(
        elevation: 8,
        color: Colors.grey[200],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(4),
        child: child,
      ),
    );
  }
}
