import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences _preferences;
  static Future<SharedPreferences> init() async =>
      _preferences = await SharedPreferences.getInstance();

  final _user = 'user';
  String? get() => _preferences.getString(_user);

  void write(String userData) {
    _preferences.setString(_user, userData);
  }

  void delete() => _preferences.remove(_user);
}
