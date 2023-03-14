import 'package:test_mobile/domains/entities/user.dart';

class UserDetailsMapper {
  Users convertApiDetails(dynamic response) {
    late Users detailsUsers;
    var data = response['data'];
    if (data != null) {
      detailsUsers = Users(
        avatar: data['avatar'],
        email: data['email'],
        firstName: data['first_name'],
        id: data['id'],
        lastName: data['last_name'],
      );
    }

    return detailsUsers;
  }
}
