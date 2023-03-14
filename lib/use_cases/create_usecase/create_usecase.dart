import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:test_mobile/data/payload/api/create_api_request.dart';
import 'package:test_mobile/data/persistences/repositories/repository_user_data.dart';
import 'package:test_mobile/domains/entities/create.dart';

class GetCreateUseCase extends UseCase<Create, CreateApiRequest> {
  final UserRepository _repository;

  GetCreateUseCase(this._repository);

  @override
  Future<Stream<Create?>> buildUseCaseStream(CreateApiRequest? params) async {
    final StreamController<Create> controller = StreamController();
    try {
      print("ini dari usecase : $params");
      Create documents = await _repository.getCreateUser(params!);
      print("ini dari usecase : $documents");
      controller.add(documents);
      controller.close();
    } catch (e) {
      print("ini dari usecase errornya : $e");
      controller.addError(e);
    }
    return controller.stream;
  }
}
