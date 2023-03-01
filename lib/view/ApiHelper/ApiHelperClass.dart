import 'dart:convert';

import 'package:video_calling_app/model/ApiModel.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  Future<AdModel> AdData() async {
    Map<String, String> requestHeaders = {
      'Host': '<calculated when request is sent>',
      'User-Agent': 'PostmanRuntime/7.30.0',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      'authorization': 'admin',
    };
    late String BaseUrl;

    BaseUrl = "http://3.108.31.187:8080/get-appkey/6";
    var newsString =
        await http.get(Uri.parse(BaseUrl), headers: requestHeaders);
    var newsJson = jsonDecode(newsString.body);
    return AdModel.fromJson(newsJson);
  }
}
