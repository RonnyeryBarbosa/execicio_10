import 'package:internal_storege/internal_storage.dart';
import 'package:internal_storege/secure_storage_adapter.dart';
import 'package:internal_storege/shared_preferences_adapter.dart';

class FormModel {
  String? _name;
  String? _surname;
  final InternalStorageAdapter internalStorage;

  FormModel({InternalStorageAdapter? internalStorageAdapter})
      : internalStorage = internalStorageAdapter ?? SharedPreferencesAdapter();

  void saveUser() {
    if (_name == null) return;
    if (_surname == null) return;
    internalStorage.saveUser(_name!, _surname!);
  }

  Future<String> getFullName() {
    return internalStorage.getFullName();
  }

  Future<String> getName() {
    return internalStorage.getName();
  }

  Future<String> getSurname() {
    return internalStorage.getSurname();
  }

  void saveName(String name) {
    _name = name;
    if (name == null) return;
    internalStorage.saveName(name);
  }

  void saveSurname(String surname) {
    _surname = surname;
    if (surname == null) return;
    internalStorage.saveSurname(surname);
  }
}
