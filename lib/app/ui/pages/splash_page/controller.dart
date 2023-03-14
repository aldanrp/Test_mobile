import 'package:test_mobile/app/core.dart';
import 'package:test_mobile/app/infrastructures/base_controller.dart';
import 'package:test_mobile/app/ui/pages/pages.dart';

class SplashController extends BaseController {
  @override
  void disposing() {
    // TODO: implement disposing
  }

  @override
  void getArgs() {
    // TODO: implement getArgs
  }

  @override
  void initListeners() {
    // TODO: implement initListeners
  }

  @override
  void load() {
    delay(() {
      Navigator.pushNamedAndRemoveUntil(
          context, Pages.boarding, (route) => false);
      print("pindah masuk boarding");
    }, period: 5);
  }
}
