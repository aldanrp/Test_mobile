import 'package:injector/injector.dart';
import 'package:test_mobile/data/persistences/mappers/user_create_mappers.dart';
import 'package:test_mobile/data/persistences/mappers/user_detail_mappers.dart';
import 'package:test_mobile/data/persistences/mappers/user_mappers.dart';
import 'package:test_mobile/data/persistences/mappers/user_update_mapper.dart';

class MapperModule {
  static void init(Injector injector) {
    injector.registerSingleton(() => UserMapper());
    injector.registerSingleton(() => UserCreateMapper());
    injector.registerSingleton(() => UserUpdateMapper());
    injector.registerSingleton(() => UserDetailsMapper());
  }
}
