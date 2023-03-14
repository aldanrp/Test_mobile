import 'dart:convert';

import 'package:test_mobile/data/payload/contracts/api_request_interface.dart';

abstract class ApiServiceInterface {
  Future<Map<String, dynamic>> invokeHttp(
    dynamic url,
    RequestType type, {
    Map<String, String> headers,
    ApiRequestInterface body,
    Map<String, dynamic> params,
    Encoding encoding,
    bool needThrowError,
  });
}

enum RequestType { get, post, put, patch, delete }
