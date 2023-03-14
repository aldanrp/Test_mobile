import 'package:injector/injector.dart';
import 'package:test_mobile/app/infrastructures/endpoints.dart';
import 'package:test_mobile/app/infrastructures/persistences/api_service.dart';
import 'package:test_mobile/app/repositories/api/user_repository_api.dart';
import 'package:test_mobile/data/persistences/mappers/user_create_mappers.dart';
import 'package:test_mobile/data/persistences/mappers/user_detail_mappers.dart';
import 'package:test_mobile/data/persistences/mappers/user_mappers.dart';
import 'package:test_mobile/data/persistences/mappers/user_update_mapper.dart';

class RepositoryModule {
  static init(Injector injector) {
    injector.registerDependency<UserApiRepository>(() {
      return UserApiRepository(
        injector.get<ApiService>(),
        injector.get<Endpoints>(),
        injector.get<UserMapper>(),
        injector.get<UserDetailsMapper>(),
        injector.get<UserUpdateMapper>(),
        injector.get<UserCreateMapper>(),
      );
    });
  }
}
