import 'package:flutter/material.dart';
import './screens/loading_screen.dart';
import './screens/sl_dashboard.dart';
import './screens/global_dashboard.dart';
import './screens/call_screen.dart';
import './screens/faq_screen.dart';

void main() => runApp(
      MaterialApp(
        initialRoute: LoadingScreen.id,
        routes: {
          SlDashboard.id: (context) => SlDashboard(),
          GlobalDashboard.id: (context) => GlobalDashboard(),
          LoadingScreen.id: (context) => LoadingScreen(),
          CallScreen.id: (context) => CallScreen(),
          FAQScreen.id: (context) => FAQScreen(),
        },
      ),
    );
