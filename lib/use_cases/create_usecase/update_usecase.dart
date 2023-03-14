import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:test_mobile/data/payload/api/update_api_request.dart';
import 'package:test_mobile/data/persistences/repositories/repository_user_data.dart';
import 'package:test_mobile/domains/entities/update.dart';

class GetUpdateUseCase extends UseCase<Update, UpdateApiRequest> {
  final UserRepository _repository;

  GetUpdateUseCase(this._repository);

  @override
  Future<Stream<Update?>> buildUseCaseStream(UpdateApiRequest? params) async {
    final StreamController<Update> controller = StreamController();
    try {
      print("ini dari usecase : $params");
      Update documents = await _repository.getUpdateUser(params!);
      controller.add(documents);
      controller.close();
    } catch (e) {
      controller.addError(e);
    }
    return controller.stream;
  }
}
