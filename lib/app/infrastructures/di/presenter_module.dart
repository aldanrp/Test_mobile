import 'package:injector/injector.dart';
import 'package:test_mobile/app/ui/pages/boarding_page/presenter.dart';
import 'package:test_mobile/app/ui/pages/create_page/presenter_create.dart';
import 'package:test_mobile/app/ui/pages/read_page/presenter.dart';
import 'package:test_mobile/app/ui/pages/update_page/presenter_update.dart';

import 'package:test_mobile/use_cases/create_usecase/create_usecase.dart';
import 'package:test_mobile/use_cases/create_usecase/delete_usecase.dart';
import 'package:test_mobile/use_cases/create_usecase/details_usecase.dart';
import 'package:test_mobile/use_cases/create_usecase/update_usecase.dart';
import 'package:test_mobile/use_cases/read_usecase/read_usecase.dart';

class PresenterModule {
  static void init(Injector injector) {
    injector.registerDependency<BoardingPresenter>(() {
      return BoardingPresenter();
    });
    injector.registerDependency<ReadPresenter>(() {
      return ReadPresenter(injector.get<GetAllUserUseCase>());
    });
    injector.registerDependency<CreatePresenter>(() {
      return CreatePresenter(injector.get<GetCreateUseCase>());
    });
    injector.registerDependency<UpdatePresenter>(() {
      return UpdatePresenter(injector.get<GetDetailsUseCase>(),
          injector.get<GetUpdateUseCase>(), injector.get<DeleteUseCase>());
    });
  }
}
