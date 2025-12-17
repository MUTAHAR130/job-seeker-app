import 'dart:convert';
import 'dart:developer';
import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:get/get.dart';

import '../../common/constant/app_constants.dart';
import '../../services/shared_data.dart';
import '../app_exception.dart';
import 'base_api_services.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getApi(String url, {dynamic data, int limit = 10}) async {
    dynamic responseJson;

    try {
      Uri uri = Uri.parse(url);

      if (data != null) {
        uri = uri.replace(queryParameters: data);
      }

      final request = http.Request("GET", uri);

      String? token = SharedData.containKey(AppConstants.tokenKey)
          ? SharedData.getPrefsString(AppConstants.tokenKey)
          : null;

      request.headers.addAll({
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      });

      final response = await request.send();

      responseJson = returnResponse(await http.Response.fromStream(response));
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }

    return responseJson;
  }

  @override
  Future postApi(String url, dynamic data, {int limit = 10}) async {
    dynamic responseJson;

    try {
      String? token = SharedData.containKey(AppConstants.tokenKey)
          ? SharedData.getPrefsString(AppConstants.tokenKey)
          : null;

      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
        },
        body: jsonEncode(data),
      );

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }

    return responseJson;
  }

  @override
  Future multiPartPostApi(String url, Map<String, dynamic> data) async {
    dynamic responseJson;

    try {
      String? token = SharedData.containKey(AppConstants.tokenKey)
          ? SharedData.getPrefsString(AppConstants.tokenKey)
          : null;

      var uri = Uri.parse(url);
      var request = http.MultipartRequest('POST', uri);

      // Add headers
      request.headers.addAll({
        if (token != null) 'Authorization': 'Bearer $token',
      });

      log(data.toString());
      log(url.toString());

      // Add fields and files
      for (var entry in data.entries) {
        final key = entry.key;
        final value = entry.value;

        if (value is XFile) {
          final bytes = await value.readAsBytes();
          final multifile = http.MultipartFile.fromBytes(
            key,
            bytes,
            filename: value.name,
            contentType: MediaType('image', 'jpeg'),
          );
          log("$key uploaded $multifile");
          request.files.add(multifile);
        } else if (value is http.MultipartFile) {
          request.files.add(value);
        } else {
          request.fields[key] = value.toString();
        }
      }

      // Send request
      var streamedResponse = await request.send();

      // Convert streamed response to regular response
      var response = await http.Response.fromStream(streamedResponse);

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }

    return responseJson;
  }

  @override
  Future patchApi(String url, dynamic data) async {
    dynamic responseJson;

    try {
      String? token = SharedData.containKey(AppConstants.tokenKey)
          ? SharedData.getPrefsString(AppConstants.tokenKey)
          : null;

      final response = await http.patch(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
        },
        body: jsonEncode(data),
      );

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }

    return responseJson;
  }

  @override
  Future deleteApi(String url, dynamic data) async {
    dynamic responseJson;

    try {
      String? token = SharedData.containKey(AppConstants.tokenKey)
          ? SharedData.getPrefsString(AppConstants.tokenKey)
          : null;

      final response = await http.delete(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
        },
        body: jsonEncode(data),
      );

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    log("Status Code: ${response.statusCode}");
    log("Response Data: ${response.body}");
    final responseBody = jsonDecode(response.body);

    switch (response.statusCode) {
      case 200:
        return responseBody;
      case 201:
        return responseBody;
      case 400:
        throw BadRequestException(responseBody["message"].toString());
      case 401:
        throw UnAuthorizedException(responseBody["message"].toString());
      default:
        throw FetchDataException(
          "Error Occur During Connection\nStatus-Code: ${response.statusCode}\nmessage:${responseBody["message"].toString()}",
        );
    }
  }
}
