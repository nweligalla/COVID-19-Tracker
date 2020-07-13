import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trackingcorona/services/health_data.dart';
import 'package:trackingcorona/components/reusable_card.dart';
import 'package:trackingcorona/components/title_container.dart';
import 'package:trackingcorona/components/reusable_mini_card.dart';
import 'package:trackingcorona/components/custom_FAB.dart';
import 'package:trackingcorona/components/under_Container.dart';
import 'package:trackingcorona/components/constants.dart';

class GlobalDashboard extends StatefulWidget {
  final Map mapData;

  GlobalDashboard({this.mapData});

  static const String id = "GlobalDashboard";
  @override
  _GlobalDashboardState createState() => _GlobalDashboardState();
}

class _GlobalDashboardState extends State<GlobalDashboard> {
  int _globalDailyCases;
  int _globalDailyDeaths;
  int _globalTotalDeaths;
  int _globalTotalCases;
  int _globalTotalRecoverd;
  String _updateTime;

  void updateUI(Map data) {
    _globalDailyCases = data["globalDailyCases"];
    _globalDailyDeaths = data["globalDailyDeaths"];
    _globalTotalDeaths = data["globalTotalDeaths"];
    _globalTotalCases = data["globalTotalCases"];
    _globalTotalRecoverd = data["globalTotalRecoverd"];
    _updateTime = data["updateTime"];
  }

  @override
  void initState() {
    updateUI(widget.mapData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: CustomFAB(
          color: Colors.blueGrey.shade900,
          label: "Sri Lanka",
          icon: FontAwesomeIcons.globeAsia,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              HealthData healthData = HealthData();
              var hlthData = await healthData.getHealthData();
              setState(() {
                updateUI(hlthData);
              });
            },
            child: ListView(
              children: <Widget>[
                TitleContainer(),
                Center(
                  child: Text(
                    "Last updated at $_updateTime",
                    style: lastUpdateTextStyle,
                  ),
                ),
                UnderContainer(
                  color: Colors.grey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          "Total",
                          style: cardTitleTextStyle,
                        ),
                      ),
                      ReusableCard(
                        cardColor: Color(0xFFfffbd9),
                        tag: "TotalConfirmed",
                        iconColor: Colors.red,
                        titleColor: Colors.green,
                        title: "Total Confirmed Cases",
                        icon: FontAwesomeIcons.viruses,
                        value: _globalTotalCases,
                      ),
                      ReusableCard(
                        cardColor: Color(0xFFffd9d9),
                        tag: "totaldead",
                        titleColor: Colors.red,
                        iconColor: Colors.green[900],
                        title: "Deaths",
                        icon: FontAwesomeIcons.biohazard,
                        value: _globalTotalDeaths,
                      ),
                      ReusableCard(
                        cardColor: Color(0xFFf1ffed),
                        tag: "totalRecoverd",
                        title: "Recovered & Discharged",
                        titleColor: Colors.deepOrange,
                        icon: FontAwesomeIcons.hospitalUser,
                        iconColor: Colors.teal,
                        value: _globalTotalRecoverd,
                      )
                    ],
                  ),
                ),
                UnderContainer(
                  color: Colors.grey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          "Daily",
                          style: cardTitleTextStyle,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: ReusableMiniCard(
                                cardColor: Color(0xFFeefccc),
                                icon: FontAwesomeIcons.ambulance,
                                tag: "newcase",
                                title: "New Cases",
                                value: _globalDailyCases,
                                titleColor: Colors.indigo,
                                iconColor: Colors.lightBlue[900]),
                          ),
                          Expanded(
                            child: ReusableMiniCard(
                                cardColor: Color(0xFFfff3cc),
                                icon: FontAwesomeIcons.lungsVirus,
                                tag: "dailydead",
                                title: "Deaths",
                                value: _globalDailyDeaths,
                                titleColor: Colors.teal,
                                iconColor: Colors.red),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 80,
                )
              ],
            ),
          ),
        ));
  }
}
