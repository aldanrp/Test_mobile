import 'package:test_mobile/domains/entities/update.dart';

class UserUpdateMapper {
  Update convertApiDetails(dynamic response) {
    Update detailsUsers = Update.fromJson(response);

    return detailsUsers;
  }
}
