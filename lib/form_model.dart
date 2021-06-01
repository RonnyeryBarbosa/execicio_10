import 'package:internal_storege/internal_storage.dart';
import 'package:internal_storege/secure_storage_adapter.dart';
import 'package:internal_storege/shared_preferences_adapter.dart';

class FormModel {
  String? name;
  String? surname;
  final InternalStorageAdapter internalStorage;

  FormModel({InternalStorageAdapter? internalStorageAdapter})
      : internalStorage = internalStorageAdapter ?? SharedPreferencesAdapter();

  void saveUser() {
    if (name == null) return;
    if (surname == null) return;
    internalStorage.saveUser(name!, surname!);
  }

  Future<String> getFullName() {
    return internalStorage.getFullName();
  }
}
