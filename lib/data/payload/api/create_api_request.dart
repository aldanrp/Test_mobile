import 'package:test_mobile/data/payload/contracts/api_request_interface.dart';
import 'package:test_mobile/data/payload/contracts/create_user_interface.dart';

class CreateApiRequest implements UserRequestInterface, ApiRequestInterface {
  String firstName;
  String lastName;
  String email;

  CreateApiRequest(this.firstName, this.lastName, this.email);

  @override
  Map<String, dynamic> encode() {
    return {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
    };
  }
}
