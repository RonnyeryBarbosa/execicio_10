import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class InternalStorageAdapter {
  void saveUser(String name, String surname);
  Future<String> getFullName();
}
