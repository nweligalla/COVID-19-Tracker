import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import './sl_dashboard.dart';
import '../services/health_data.dart';
import '../widgets/title_container.dart';
import '../components/constants.dart';

class LoadingScreen extends StatefulWidget {
  static String id = "loading_screen";
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool isError;
  Future getInitialHealthData() async {
    HealthData healthData = HealthData();
    var hdata = await healthData.getHealthData();
    if (hdata != false) {
      isError = false;
      Navigator.of(context)
          .pushReplacementNamed(SlDashboard.id, arguments: hdata);
    } else {
      isError = true;
    }
  }

  @override
  void initState() {
    super.initState();
    getInitialHealthData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Shimmer.fromColors(
            baseColor: Colors.black,
            highlightColor: Colors.white,
            child: TitleContainer(),
          ),
        ]),
      ),
    );
  }
}
