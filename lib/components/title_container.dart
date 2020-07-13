import 'package:flutter/material.dart';

class TitleContainer extends StatelessWidget {
  const TitleContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      margin: EdgeInsets.only(top: 15),
      padding: const EdgeInsets.only(
        bottom: 15,
        left: 15,
        right: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "COVID-19",
            style: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 55,
                fontFamily: "FredokaOne",
                letterSpacing: 1),
          ),
          Text(
            " Live Situational Dashboard.",
            style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                fontFamily: "Oxanium"),
          )
        ],
      ),
    );
  }
}
