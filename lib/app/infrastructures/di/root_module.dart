import 'dart:convert';

// import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injector/injector.dart';

import 'package:test_mobile/app/infrastructures/endpoints.dart';
import 'package:test_mobile/app/infrastructures/persistences/api_service.dart';

class RootModule {
  static Future<void> init(Injector injector) async {
    await dotenv.load(fileName: ".env");

    injector
        .registerSingleton<Endpoints>(() => Endpoints(dotenv.env['BASE_URL']!));

    // injector.registerSingleton<UserData>(() => UserData(sp));

    injector.registerDependency<Dio>(() {
      var dio = Dio();
      dio.options.connectTimeout = 60000;
      dio.options.receiveTimeout = 60000;

      var endpoints = injector.get<Endpoints>();
      // var userData = injector.get<UserData>();

      // use for log response and request data
      dio.interceptors.add(LogInterceptor(
        requestBody: false,
        responseBody: false,
        requestHeader: false,
        responseHeader: false,
        request: false,
      ));
      dio.interceptors.add(
          DioCacheManager(CacheConfig(baseUrl: endpoints.baseUrl)).interceptor);
      dio.options.baseUrl = endpoints.baseUrl;
      // dio.options.headers['Authorization'] = "Bearer ${userData.token}";

      (dio.transformer as DefaultTransformer).jsonDecodeCallback = parseJson;

      // add interceptors
      // if (!kReleaseMode) {
      //   var alice = injector.get<Alice>();
      //   dio.interceptors.add(alice.getDioInterceptor());
      // }

      return dio;
    });

    injector.registerSingleton<EventBus>(() {
      return EventBus();
    });

    injector.registerDependency<ApiService>(() {
      return ApiService(injector.get<Dio>(), injector.get<EventBus>());
    });

    // provide navigator key
    injector.registerSingleton<GlobalKey<NavigatorState>>(() {
      return GlobalKey<NavigatorState>();
    });

    // injector.registerSingleton<Alice>(() {
    //   Alice alice = Alice(
    //     darkTheme: true,
    //     showInspectorOnShake: true,
    //     showNotification: true,
    //   );
    //   alice.setNavigatorKey(injector.get<GlobalKey<NavigatorState>>());
    //   return alice;
    // });
  }

  static parseAndDecode(String response) {
    return jsonDecode(response);
  }

  static parseJson(String text) {
    return compute(parseAndDecode, text);
  }
}
