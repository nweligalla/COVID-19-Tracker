import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../modals/call_data.dart';
import '../components/constants.dart';

class CallScreen extends StatefulWidget {
  static String id = "CallScreen";
  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  List<CallData> callinfo = CallData.callInfomation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Text("Emergency Contacts"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[600],
      ),
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: ListView.builder(
            itemCount: callinfo.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Card(
                  color: Colors.grey[50],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 16,
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 5,
                        bottom: 8,
                      ),
                      child: Text(
                        callinfo[index].name,
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(
                        left: 7,
                        bottom: 10,
                      ),
                      child: Text(
                        callinfo[index].discription,
                        style: TextStyle(
                          color: Colors.grey[900],
                          fontSize: 18,
                        ),
                      ),
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () =>
                              launch("tel://${callinfo[index].number}"),
                          child: Icon(
                            Icons.call,
                            color: Colors.grey[850],
                            size: 45,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
