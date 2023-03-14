import 'package:injector/injector.dart';
import 'package:test_mobile/app/repositories/api/user_repository_api.dart';
import 'package:test_mobile/use_cases/create_usecase/create_usecase.dart';
import 'package:test_mobile/use_cases/create_usecase/delete_usecase.dart';
import 'package:test_mobile/use_cases/create_usecase/details_usecase.dart';
import 'package:test_mobile/use_cases/create_usecase/update_usecase.dart';
import 'package:test_mobile/use_cases/read_usecase/read_usecase.dart';

class UseCaseModule {
  static void init(Injector injector) {
    injector.registerDependency<GetAllUserUseCase>(() {
      return GetAllUserUseCase(injector.get<UserApiRepository>());
    });
    injector.registerDependency<GetCreateUseCase>(() {
      return GetCreateUseCase(injector.get<UserApiRepository>());
    });
    injector.registerDependency<GetDetailsUseCase>(() {
      return GetDetailsUseCase(injector.get<UserApiRepository>());
    });
    injector.registerDependency<GetUpdateUseCase>(() {
      return GetUpdateUseCase(injector.get<UserApiRepository>());
    });
    injector.registerDependency<DeleteUseCase>(() {
      return DeleteUseCase(injector.get<UserApiRepository>());
    });
  }
}
