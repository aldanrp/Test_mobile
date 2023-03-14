import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:test_mobile/app/infrastructures/app_component.dart';
import 'package:test_mobile/app/infrastructures/events/connection.dart';

abstract class BaseController extends Controller {
  BaseController() : super();

  final ScrollController _listScrollController = ScrollController();

  Object? args;
  bool isLoading = true;
  bool isConnected = true;
  bool isReloading = false;

  BuildContext get context => getContext();

  ScrollController get listScrollController => _listScrollController;

  @override
  void onInitState() {
    super.onInitState();
    getArgs();
    load();

    AppComponent.getInjector()
        .get<EventBus>()
        .on<ConnectionEvent>()
        .listen((event) async {
      isConnected = event.isOnline;
      refreshUI();
    });
  }

  void setScrollListener(Function func) {
    _listScrollController.addListener(() => scrollListener(func));
  }

  scrollListener(Function func) {
    if (_listScrollController.offset >=
            _listScrollController.position.maxScrollExtent &&
        !_listScrollController.position.outOfRange) {
      func();
    }
  }

  // bool checkTokenExpired() {
  //   var userData = AppComponent.getInjector().get<UserData>();

  //   if (userData.token.isNullOrBlank() ||
  //       userData.tokenExpired <= DateTime.now().millisecondsSinceEpoch) {
  //     userData.clear();
  //     return false;
  //   }

  //   return true;
  // }

  void delay(Function func, {int period = 2}) {
    Future.delayed(
      Duration(seconds: period),
      () async {
        func();
      },
    );
  }

  void delayMillis(Function func, {int milliseconds = 2}) {
    Future.delayed(
      Duration(milliseconds: milliseconds),
      () async {
        func();
      },
    );
  }

  void loading(bool isLoad) {
    isLoading = isLoad;
    refreshUI();
  }

  void reloading(bool isReload) {
    isReloading = isReload;
    refreshUI();
  }

  void onError() {}

  @protected
  void getArgs();

  @protected
  void load();

  @protected
  void disposing();

  @override
  void initListeners();

  @override
  void onDisposed() {
    super.onDisposed();
    disposing();
  }
}
