import 'package:injector/injector.dart';
import 'package:test_mobile/app/core.dart';
import 'package:test_mobile/app/ui/pages/create_page/controller.dart';
import 'package:test_mobile/app/ui/pages/create_page/presenter_create.dart';
import 'package:test_mobile/app/ui/pages/read_page/controller.dart';
import 'package:test_mobile/app/ui/pages/read_page/presenter.dart';
import 'package:test_mobile/app/ui/pages/update_page/controller.dart';
import 'package:test_mobile/app/ui/pages/update_page/presenter_update.dart';

class ControllerModule {
  static void init(Injector injector) {
    injector.registerDependency<BoardingController>(() {
      return BoardingController();
    });
    injector.registerDependency<SplashController>(() {
      return SplashController();
    });

    injector.registerDependency<ReadController>(() {
      return ReadController(injector.get<ReadPresenter>());
    });
    injector.registerDependency<CreateController>(() {
      return CreateController(injector.get<CreatePresenter>());
    });
    injector.registerDependency<UpdateController>(() {
      return UpdateController(injector.get<UpdatePresenter>());
    });
  }
}
