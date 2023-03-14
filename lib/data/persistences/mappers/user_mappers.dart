import 'package:test_mobile/domains/entities/user.dart';

class UserMapper {
  List<Users> convertApiGetUsers(dynamic response) {
    var aktifitas = List<Users>.empty(growable: true);

    var data = response['data'];
    if (data != null) {
      for (var value in data) {
        aktifitas.add(Users(
          avatar: value['avatar'],
          email: value['email'],
          firstName: value['first_name'],
          id: value['id'],
          lastName: value['last_name'],
        ));
      }
    }

    return aktifitas;
  }
}
