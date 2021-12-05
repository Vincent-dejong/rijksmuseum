import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  static Future<Uri> _apiUrl(
    String endpoint, {
    Map<String, String> queryParams = const {},
  }) async {
    final contents = await rootBundle.loadString(
      'assets/config.json',
    );

    final json = jsonDecode(contents);

    String params = '?key=${json['apiKey']}';

    queryParams.forEach((key, value) {
      params += '&$key=$value';
    });

    String url = Uri.encodeFull(json['apiUrl'] + endpoint + params);

    return Uri.parse(url);
  }

  static _getHeaders() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    return headers;
  }

  static Future<Either<Exception, Map<String, dynamic>>> get(
    String endpoint, {
    Map<String, String> queryParams = const {},
  }) async {
    final _url = await _apiUrl(endpoint, queryParams: queryParams);
    final _headers = await _getHeaders();

    http.Response response = await http.get(_url, headers: _headers);

    return checkResponse(response);
  }

  static Future<Either<Exception, Map<String, dynamic>>> post(String endpoint,
      {required Map body}) async {
    final _url = await _apiUrl(endpoint);
    final _headers = await _getHeaders();
    final _body = json.encode(body);

    http.Response response =
        await http.post(_url, body: _body, headers: _headers);

    return checkResponse(response);
  }

  static Future<Either<Exception, Map<String, dynamic>>> patch(String endpoint,
      {required Map body}) async {
    final _url = await _apiUrl(endpoint);
    final _headers = await _getHeaders();
    final _body = json.encode(body);

    http.Response response =
        await http.patch(_url, body: _body, headers: _headers);

    return checkResponse(response);
  }

  static Either<Exception, Map<String, dynamic>> checkResponse(response) {
    final int statusCode = response.statusCode;
    if (statusCode != 200) {
      return Left(Exception(['Error while during request: $statusCode']));
    }

    return Right(json.decode(response.body));
  }
}
