import 'package:http/http.dart';
import 'dart:convert';

class HealthNetwork {
  Future getHealthData() async {
    Response response =
        await get("https://www.hpb.health.gov.lk/api/get-current-statistical");

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return "Error";
    }
  }
}
