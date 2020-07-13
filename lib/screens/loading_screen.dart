import 'package:flutter/material.dart';
import 'package:trackingcorona/screens/sl_dashboard.dart';
import 'package:trackingcorona/services/health_data.dart';
import 'package:trackingcorona/components/title_container.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trackingcorona/components/constants.dart';

class LoadingScreen extends StatefulWidget {
  static String id = "loading_screen";
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future getInitialHealthData() async {
    HealthData healthData = HealthData();
    var hdata = await healthData.getHealthData();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return SlDashboard(
            dataMap: hdata,
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getInitialHealthData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Shimmer.fromColors(
          baseColor: Colors.black,
          highlightColor: Colors.white,
          child: TitleContainer(),
        ),
      ),
    );
  }
}
