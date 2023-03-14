import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:test_mobile/data/persistences/repositories/repository_user_data.dart';
import 'package:test_mobile/domains/entities/user.dart';

class DeleteUseCase extends UseCase<dynamic, int> {
  final UserRepository _repository;

  DeleteUseCase(this._repository);

  @override
  Future<Stream<dynamic>> buildUseCaseStream(int? params) async {
    final StreamController<Users> controller = StreamController();
    try {
      print("ini dari usecase : $params");
      dynamic documents = await _repository.deleteUser(params!);
      print("ini dari usecase delete $documents");
      controller.add(documents);
      controller.close();
    } catch (e) {
      print("ini dari usecase delete errornya $e");
      controller.addError(e);
    }
    return controller.stream;
  }
}
