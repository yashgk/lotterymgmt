import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lotto_mgmt/core/network/network_exceptions.dart';

class NetworkService {
  String baseUrl = "http://localhost:8080/api/v1";

  Future<Map<String, dynamic>> get(String endpoint) async {
    Map<String, dynamic> respJson;
    try {
      http.Response response = await http.get(
        Uri.parse("$baseUrl$endpoint"),
        headers: {'Content-Type': 'application/json'},
      );
      respJson = validate(response);
    } catch (e) {
      rethrow;
    }
    return respJson;
  }

  Future<Map<String, dynamic>> post(
      String endpoint, Map<String, dynamic> body) async {
    Map<String, dynamic> respJson;
    try {
      http.Response response = await http.post(Uri.parse("$baseUrl$endpoint"),
          body: json.encode(body),
          headers: {'Content-Type': 'application/json'});
      respJson = validate(response);
    } catch (e) {
      rethrow;
    }
    return respJson;
  }

  Future<Map<String, dynamic>> put(
      String endpoint, Map<String, dynamic> body) async {
    Map<String, dynamic> respJson;
    try {
      http.Response response = await http.put(Uri.parse("$baseUrl$endpoint"),
          body: json.encode(body),
          headers: {'Content-Type': 'application/json'});
      respJson = validate(response);
    } catch (e) {
      rethrow;
    }
    return respJson;
  }

  dynamic validate(http.Response response) {
    var responseJson = json.decode(response.body.toString());
    switch (response.statusCode) {
      case 200:
      case 201:
        return responseJson;
      case 400:
        throw BadRequestException(responseJson['error'].toString());
      case 401:
      case 403:
        throw UnauthorisedException(responseJson['error'].toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
