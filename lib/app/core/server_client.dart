import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'string_const.dart';

class ServerClient {
  static const FlutterSecureStorage _storage = FlutterSecureStorage();
  static const int _timeout = 180;

  /// Get request

  static Future<List> get(String url) async {
    String? token = await _storage.read(key: StringConst.token);
    // String? token =
    //     '5dac68d93137d6ff06b582736ac2029a66d0cc1a64a19dce1450b0149ada523cea1377c615cf44c3f521cb2f8748259cbe464ae7ea7620d0d7a0fc49f844e92c7a9e39bc4dc8a0f9a3a840a2b0b193bf521f5b9c038d54517bae5831703eeabcb6573738e2bf268c5e6d8ac8ac4f8e5f391288d4da7d223da72ccd66449003eb40ffb78cf99be91309dae48215ec3193bac62402a1f9ad16ae48a9134c2feb7afc9f5dc1b97c9b8b64a1c79a600c54ff';
    log("urlll :: $url");
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "country": "INDIA",
      "authorization": "Bearer $token",
    };
    log('token$token');
    log("urlllllllllllllllllllll :: $url");
    try {
      var response = await http.get(Uri.parse(url), headers: headers);
      log('profile ${response.body}');
      return _response(response);
    } on SocketException {
      return [600, "No internet"];
    } catch (e) {
      log('profile ERRRRRRRRORRRRRRRRRRRRRR ${e.toString()}');
      return [600, e.toString()];
    }
  }

  /// Post request

  static Future<List> post(
    String url, {
    Map<String, dynamic>? data,
    bool post = true,
  }) async {
    String? token = await _storage.read(key: StringConst.token);
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "authorization": "Bearer $token",
    };
    log('token$token');
    log("{data} :: $data");
    log("urlllllllllllllllllllll :: $url");
    try {
      var body = json.encode(data);
      var response = await http
          .post(Uri.parse(url), body: post ? body : null, headers: headers)
          .timeout(const Duration(seconds: _timeout));
      return _response(response);
    } on SocketException {
      return [600, "No internet"];
    } catch (e) {
      return [600, e.toString()];
    }
  }

  /// Put request

  static Future<List> put(
    String url, {
    Map<String, dynamic>? data,
    bool put = false,
  }) async {
    String? token = await _storage.read(key: StringConst.token);
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "authorization": "Bearer $token",
    };
    try {
      String? body = json.encode(data);
      var response = await http
          .put(Uri.parse(url), body: put ? null : body, headers: headers)
          .timeout(const Duration(seconds: _timeout));
      return _response(response);
    } on SocketException {
      return [600, "No internet"];
    } catch (e) {
      return [600, e.toString()];
    }
  }

  /// Delete request

  static Future<List> delete(String url, {String? id}) async {
    String? token = await _storage.read(key: StringConst.token);
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "authorization": "Bearer $token",
    };
    var response = await http.delete(Uri.parse(url), headers: headers);
    return await _response(response);
  }

  // ------------------- ERROR HANDLING ------------------- \\

  static Future<List> _response(http.Response response) async {
    switch (response.statusCode) {
      case 200:
        return [response.statusCode, jsonDecode(response.body)];
      case 201:
        return [response.statusCode, jsonDecode(response.body)];
      case 400:
        return [response.statusCode, jsonDecode(response.body)["message"]];
      case 401:
        return [response.statusCode, jsonDecode(response.body)["message"]];
      case 403:
        return [response.statusCode, jsonDecode(response.body)["message"]];
      case 404:
        return [response.statusCode, "You're using unregistered application"];
      case 500:
        return [response.statusCode, "Server error"];
      case 503:
        return [response.statusCode, jsonDecode(response.body)["message"]];
      case 504:
        return [
          response.statusCode,
          {"message": "Request timeout", "code": 504, "status": "Cancelled"}
        ];
      default:
        return [response.statusCode, jsonDecode(response.body)["message"]];
    }
  }
}
