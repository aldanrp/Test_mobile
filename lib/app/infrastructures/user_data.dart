import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_mobile/app/infrastructures/constants.dart';

class UserData {
  late String id = "";
  late String name = "";
  late String email = "";

  final SharedPreferences _sharedPreferences;

  UserData(this._sharedPreferences) {
    loadData();
  }

  void loadData() {
    id = _sharedPreferences.getString(AppConstants.USER_DATA_ID) ?? "";
    name = _sharedPreferences.getString(AppConstants.USER_DATA_NAME) ?? "";
    email = _sharedPreferences.getString(AppConstants.USER_DATA_EMAIL) ?? "";
  }

  save() {
    _sharedPreferences.setString(AppConstants.USER_DATA_ID, id);
    _sharedPreferences.setString(AppConstants.USER_DATA_NAME, name);
    _sharedPreferences.setString(AppConstants.USER_DATA_EMAIL, email);
  }

  void clear() {
    clearProperties();
    _sharedPreferences.clear();
  }

  void clearProperties() {
    id = "";
    name = "";
    email = "";
  }
}
