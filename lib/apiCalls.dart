import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

final kDataResult = "result";

Future<dynamic> CallApi(String httpType, dynamic params, var url) async {
  var response;

  try {
    if (httpType == "GET") {
      response = await http.get(url);
      print('jsh');
    } else {
      response = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/x-www-form-urlencoded"},
          body: params);
    }
  } on TimeoutException catch (_) {
    var jsonError = {
      "result": "Server not responding. Please try again later",
      "status_code": "500"
    };
    return jsonError;
  }
  var jsonResponse;
  try {
    jsonResponse = jsonDecode(response.body);
  } on Exception catch (_) {
    var jsonError = {
      kDataResult: "Something went wrong. Please try again later.",
      "status_code": "500"
    };
    return jsonError;
  }
  if (jsonResponse != null) {
    return jsonResponse;
  } else if (jsonResponse["status_code"] == 401) {
    var jsonError = {
      kDataResult: jsonResponse[kDataResult],
      "status_code": "401"
    };
    return jsonError;
  } else if (response["status_code"] == 500) {
    var jsonError = {
      kDataResult: jsonResponse[kDataResult],
      "status_code": "500"
    };
    Future.delayed(const Duration(milliseconds: 500), () {});
    return jsonError;
  } else {
    var jsonError = {
      kDataResult: "Something went wrong. Please try again later.",
      "status_code": "404"
    };
    return jsonError;
  }
}
