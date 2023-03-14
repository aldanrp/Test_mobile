import 'package:test_mobile/data/payload/api/create_api_request.dart';
import 'package:test_mobile/data/payload/api/update_api_request.dart';
import 'package:test_mobile/domains/entities/create.dart';
import 'package:test_mobile/domains/entities/update.dart';
import 'package:test_mobile/domains/entities/user.dart';

abstract class UserRepository {
  Future<List<Users>> getAllUsers(Map<String, dynamic> params);
  Future<Users> getDetailsUser(int params);
  Future<Update> getUpdateUser(UpdateApiRequest params);
  Future<Create> getCreateUser(CreateApiRequest params);
  Future<String> deleteUser(int params);
}
