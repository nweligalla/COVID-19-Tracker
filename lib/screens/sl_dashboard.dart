import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trackingcorona/components/reusable_card.dart';
import 'package:trackingcorona/screens/global_dashboard.dart';
import 'package:trackingcorona/components/custom_FAB.dart';
import 'package:trackingcorona/components/under_Container.dart';
import 'package:trackingcorona/components/title_container.dart';
import 'package:trackingcorona/components/reusable_mini_card.dart';
import 'package:trackingcorona/services/health_data.dart';
import 'package:trackingcorona/components/constants.dart';
import 'package:trackingcorona/components/main_drawer.dart';

class SlDashboard extends StatefulWidget {
  final Map dataMap;
  SlDashboard({this.dataMap});

  static const String id = "SLDashboard";
  @override
  _SlDashboardState createState() => _SlDashboardState();
}

class _SlDashboardState extends State<SlDashboard> {
  int _globalDailyCases;
  int _globalDailyDeaths;
  int _globalTotalDeaths;
  int _globalTotalCases;
  int _globalTotalRecoverd;
  int _localDailyCases;
  int _localDailyDeaths;
  int _localTotalRecoverd;
  int _localTotalSuspected;
  int _localTotalDeaths;
  int _localTotalcases;
  String _updateTime;

  int indexitem = 0;

  void updateUI(Map data) {
    _globalDailyCases = data["globalDailyCases"];
    _globalDailyDeaths = data["globalDailyDeaths"];
    _globalTotalDeaths = data["globalTotalDeaths"];
    _globalTotalCases = data["globalTotalCases"];
    _globalTotalRecoverd = data["globalTotalRecoverd"];
    _localDailyCases = data["localDailyCases"];
    _localDailyDeaths = data["localDailyDeaths"];
    _localTotalRecoverd = data["localTotalRecoverd"];
    _localTotalDeaths = data["localTotalDeaths"];
    _localTotalSuspected = data["localTotalSuspected"];
    _localTotalcases = data["localTotalcases"];
    _updateTime = data["updateTime"];
  }

  @override
  void initState() {
    updateUI(widget.dataMap);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      floatingActionButton: CustomFAB(
        label: "global",
        icon: FontAwesomeIcons.globeAmericas,
        color: Colors.blueGrey.shade900,
        onPressed: () {
          Map globalMap = {
            "globalTotalCases": _globalTotalCases,
            "globalTotalDeaths": _globalTotalDeaths,
            "globalTotalRecoverd": _globalTotalRecoverd,
            "globalDailyCases": _globalDailyCases,
            "globalDailyDeaths": _globalDailyDeaths,
            "updateTime": _updateTime
          };

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return GlobalDashboard(
                  mapData: globalMap,
                );
              },
            ),
          );
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
            physics: const AlwaysScrollableScrollPhysics(),
            children: <Widget>[
              TitleContainer(),
              Center(
                child: Text(
                  "Last updated at $_updateTime",
                  style: lastUpdateTextStyle,
                ),
              ),
              SizedBox(
                height: 7,
              ),
              UnderContainer(
                color: Colors.grey[200],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                      value: _localTotalcases,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          child: ReusableMiniCard(
                            cardColor: Color(0xFFffd9d9),
                            tag: "totaldead",
                            iconColor: Colors.green,
                            titleColor: Colors.red,
                            icon: FontAwesomeIcons.biohazard,
                            title: "Dead",
                            value: _localTotalDeaths,
                          ),
                        ),
                        Expanded(
                          child: ReusableMiniCard(
                            cardColor: Color(0xFFf1ffed),
                            tag: "totalRecoverd",
                            iconColor: Colors.limeAccent[700],
                            titleColor: Colors.blue,
                            title: "Recovered",
                            value: _localTotalRecoverd,
                            icon: FontAwesomeIcons.hospitalUser,
                          ),
                        )
                      ],
                    ),
                    ReusableCard(
                      cardColor: Color(0xFFe0e4ff),
                      tag: "totalsuspected",
                      titleColor: Colors.purple,
                      iconColor: Colors.blue,
                      title: "Suspected & Hospitalized",
                      icon: FontAwesomeIcons.procedures,
                      value: _localTotalSuspected,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 7,
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          child: ReusableMiniCard(
                            cardColor: Color(0xFFeefccc),
                            tag: "newcase",
                            iconColor: Colors.green,
                            titleColor: Colors.red,
                            icon: FontAwesomeIcons.ambulance,
                            title: "New Cases",
                            value: _localDailyCases,
                          ),
                        ),
                        Expanded(
                          child: ReusableMiniCard(
                            cardColor: Color(0xFFfff3cc),
                            tag: "dailydead",
                            iconColor: Colors.redAccent.shade700,
                            titleColor: Colors.blue,
                            title: "Deaths",
                            value: _localDailyDeaths,
                            icon: FontAwesomeIcons.lungsVirus,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 70,
              )
            ],
          ),
        ),
      ),
    );
  }
}
