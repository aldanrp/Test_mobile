import 'package:injector/injector.dart';
import 'package:test_mobile/app/infrastructures/di/controller_module.dart';
import 'package:test_mobile/app/infrastructures/di/mappers_module.dart';
import 'package:test_mobile/app/infrastructures/di/presenter_module.dart';
import 'package:test_mobile/app/infrastructures/di/repository_module.dart';
import 'package:test_mobile/app/infrastructures/di/root_module.dart';
import 'package:test_mobile/app/infrastructures/di/usecases_module.dart';

class AppComponent {
  static Future<void> init() async {
    Injector injector = getInjector();
    await RootModule.init(injector);
    MapperModule.init(injector);
    RepositoryModule.init(injector);
    UseCaseModule.init(injector);
    PresenterModule.init(injector);
    ControllerModule.init(injector);
  }

  static Injector getInjector() {
    return Injector.appInstance;
  }
}
