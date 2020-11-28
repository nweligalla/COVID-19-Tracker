import 'package:http/http.dart';
import 'dart:convert';
import '../components/constants.dart';

class HealthNetwork {
  Future getHealthData() async {
    try {
      Response response = await get(kApiKey);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
    } catch (e) {
      print("error");
    }
  }
}
