import 'dart:convert';
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/foundation.dart';
import 'package:test_mobile/app/infrastructures/events/logout.dart';
import 'package:test_mobile/data/infrastructures/api_service_interface.dart';
import 'package:test_mobile/data/payload/contracts/api_request_interface.dart';

class ApiService extends ApiServiceInterface {
  final Dio _dio;
  final EventBus _eventBus;

  ApiService(this._dio, this._eventBus);

  // send http request
  @override
  Future<Map<String, dynamic>> invokeHttp(
    dynamic url,
    RequestType type, {
    Map<String, String>? headers,
    ApiRequestInterface? body,
    Map<String, dynamic>? params,
    Encoding? encoding,
    bool needThrowError = true,
  }) async {
    Response response;
    try {
      response = await _invoke(
        url,
        type,
        headers: headers,
        body: body?.encode(),
        params: params,
      );
    } catch (error) {
      rethrow;
    }

    return response.data;
  }

  // setup requiest type and configuration
  Future<Response> _invoke(
    dynamic url,
    RequestType type, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
  }) async {
    Response response;

    try {
      switch (type) {
        case RequestType.get:
          response = await _dio.get(
            url,
            queryParameters: params,
          );
          break;
        case RequestType.post:
          response = await _dio.post(url,
              data: FormData.fromMap(body!),
              options: Options(
                headers: headers,
              ));
          break;
        case RequestType.put:
          response = await _dio.put(url,
              data: body, options: Options(headers: headers));
          break;
        case RequestType.patch:
          response = await _dio.patch(url,
              data: body, options: Options(headers: headers));
          break;
        case RequestType.delete:
          response = await _dio.delete(url, options: Options(headers: headers));
          break;
      }

      // catch token expired
      try {
        var rawResp = response.data as Map<String, dynamic>;
        if (rawResp['status'] != null &&
            rawResp['status'].toString().trim().toLowerCase() ==
                'token is expired') {
          _eventBus.fire(LogoutEvent());
        }
      } catch (e) {
        debugPrint("$e");
      }

      return response;
    } on DioError catch (e) {
      debugPrint("$e");
      rethrow;
    } catch (error) {
      rethrow;
    }
  }
}
