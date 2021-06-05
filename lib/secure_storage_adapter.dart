import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:internal_storege/internal_storage.dart';

class SecureStorageAdapter extends InternalStorageAdapter {
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  @override
  Future<String> getFullName() async {
    String? name = await secureStorage.read(key: 'name');
    String? surname = await secureStorage.read(key: 'surname');

    if ((name != null) && (surname != null)) {
      return name + ' ' + surname;
    } else {
      return 'Dados não seguros';
    }
  }

  @override
  void saveUser(String name, String surname) async {
    await secureStorage.write(key: 'name', value: name);
    await secureStorage.write(key: 'surname', value: surname);
    print('Dados Seguros');
  }

  @override
  void saveName(String name) async {
    await secureStorage.write(key: 'name_auto', value: name);
    print("save name");
  }

  @override
  void saveSurname(String surname) async {
    await secureStorage.write(key: 'surname_auto', value: surname);
  }

  @override
  Future<String> getName() async {
    String? name = await secureStorage.read(key: 'name_auto');

    if ((name != null)) {
      return name;
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<String> getSurname() async {
    String? surname = await secureStorage.read(key: 'surname_auto');

    if ((surname != null)) {
      return surname;
    } else {
      throw UnimplementedError();
    }
  }
}
