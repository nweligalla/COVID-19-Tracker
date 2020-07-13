import 'package:flutter/material.dart';
import 'package:trackingcorona/screens/loading_screen.dart';
import 'package:trackingcorona/screens/sl_dashboard.dart';
import 'package:trackingcorona/screens/global_dashboard.dart';
import 'package:trackingcorona/screens/call_screen.dart';
import 'package:trackingcorona/screens/faq_screen.dart';

void main() => runApp(
      MaterialApp(
        initialRoute: LoadingScreen.id,
        routes: {
          SlDashboard.id: (context) => SlDashboard(),
          GlobalDashboard.id: (context) => GlobalDashboard(),
          LoadingScreen.id: (context) => LoadingScreen(),
          CallScreen.id: (context) => CallScreen(),
          FAQScreen.id: (context) => FAQScreen()
        },
      ),
    );
