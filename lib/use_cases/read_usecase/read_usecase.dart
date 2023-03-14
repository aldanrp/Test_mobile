import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:test_mobile/data/persistences/repositories/repository_user_data.dart';
import 'package:test_mobile/domains/entities/user.dart';

class GetAllUserUseCase extends UseCase<List<Users>, Map<String, dynamic>> {
  final UserRepository _repository;

  GetAllUserUseCase(this._repository);

  @override
  Future<Stream<List<Users>?>> buildUseCaseStream(
      Map<String, dynamic>? params) async {
    final StreamController<List<Users>> controller = StreamController();
    try {
      print("ini dari usecase : $params");
      List<Users> documents = await _repository.getAllUsers(params!);
      controller.add(documents);
      controller.close();
    } catch (e) {
      controller.addError(e);
    }
    return controller.stream;
  }
}
