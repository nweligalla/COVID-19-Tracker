import '../services/network.dart';

class HealthData {
  // local total
  int _localTotalcases;
  int _localTotalDeaths;
  int _localTotalRecoverd;
  int _localTotalSuspected;
  // local daily
  int _localDailyCases;
  int _localDailyDeaths;
  //int localDailyRecoverd;

  //Global total
  int _globalTotalCases;
  int _globalTotalDeaths;
  int _globalTotalRecoverd;
  //Global daily
  int _globalDailyCases;
  int _globalDailyDeaths;
  //int globalDailyRecoverd;

  //miscData
  String _updateTime;

  Future getHealthData() async {
    HealthNetwork healthNetwork = HealthNetwork();
    var data = await healthNetwork.getHealthData();

    //
    _localTotalcases = data["data"]["local_total_cases"];
    _localTotalDeaths = data["data"]["local_deaths"];
    _localTotalRecoverd = data["data"]["local_recovered"];
    _localTotalSuspected =
        data["data"]["local_total_number_of_individuals_in_hospitals"];
    //
    _localDailyCases = data["data"]["local_new_cases"];
    _localDailyDeaths = data["data"]["local_new_deaths"];
    //
    _globalTotalCases = data["data"]["global_total_cases"];
    _globalTotalDeaths = data["data"]["global_deaths"];
    _globalTotalRecoverd = data["data"]["global_recovered"];
    //
    _globalDailyCases = data["data"]["global_new_cases"];
    _globalDailyDeaths = data["data"]["global_new_deaths"];
    //
    _updateTime = data["data"]["update_date_time"];

    var dMap = {
      "localTotalcases": _localTotalcases,
      "localTotalDeaths": _localTotalDeaths,
      "localTotalRecoverd": _localTotalRecoverd,
      "localTotalSuspected": _localTotalSuspected,
      "localDailyCases": _localDailyCases,
      "localDailyDeaths": _localDailyDeaths,
      "globalTotalCases": _globalTotalCases,
      "globalTotalDeaths": _globalTotalDeaths,
      "globalTotalRecoverd": _globalTotalRecoverd,
      "globalDailyCases": _globalDailyCases,
      "globalDailyDeaths": _globalDailyDeaths,
      "updateTime": _updateTime
    };

    return dMap;
  }
}
