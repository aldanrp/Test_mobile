import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:test_mobile/data/persistences/repositories/repository_user_data.dart';
import 'package:test_mobile/domains/entities/user.dart';

class GetDetailsUseCase extends UseCase<Users, int> {
  final UserRepository _repository;

  GetDetailsUseCase(this._repository);

  @override
  Future<Stream<Users?>> buildUseCaseStream(int? params) async {
    final StreamController<Users> controller = StreamController();
    try {
      print("ini dari usecase : $params");
      Users documents = await _repository.getDetailsUser(params!);
      controller.add(documents);
      controller.close();
    } catch (e) {
      controller.addError(e);
    }
    return controller.stream;
  }
}
