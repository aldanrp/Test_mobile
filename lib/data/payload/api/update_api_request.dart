import 'package:test_mobile/data/payload/contracts/api_request_interface.dart';
import 'package:test_mobile/data/payload/contracts/create_user_interface.dart';

class UpdateApiRequest implements UserRequestInterface, ApiRequestInterface {
  int id;
  String firstName;
  String lastName;
  String email;

  UpdateApiRequest(this.id, this.firstName, this.lastName, this.email);

  @override
  Map<String, dynamic> encode() {
    return {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
    };
  }
}
