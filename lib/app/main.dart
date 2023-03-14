import 'package:test_mobile/app/infrastructures/router.dart' as approuter;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_mobile/app/infrastructures/app_component.dart';
import 'package:test_mobile/app/ui/pages/splash_page/view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppComponent.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final approuter.Router _router;
  final _navigatorKey = GlobalKey<NavigatorState>();

  MyApp({super.key}) : _router = approuter.Router();
  late DateTime currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      navigatorKey: _navigatorKey,
      debugShowCheckedModeBanner: false,
      title: "Kadin Aktif Mobile",
      home: SplashPage(),
      onGenerateRoute: _router.getRoute,
      navigatorObservers: [_router.routeObserver!],
    );
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > const Duration(seconds: 3)) {
      currentBackPressTime = now;
      // Fluttertoast.showToast(msg: "press again to exit app");
      return Future.value(false);
    }
    return Future.value(true);
  }
}
