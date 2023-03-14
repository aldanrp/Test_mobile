import 'package:test_mobile/domains/entities/create.dart';

class UserCreateMapper {
  Create convertApiDetails(dynamic response) {
    Create detailsUsers = Create.fromJson(response);
    print("ini respon dari mapper 2 : $detailsUsers");
    return detailsUsers;
  }
}
