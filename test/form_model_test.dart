import 'package:flutter_test/flutter_test.dart';
import 'package:internal_storege/form_model.dart';
import 'package:internal_storege/internal_storage.dart';

void main() {
  test('check if the user has been saved', () {
    final model = FormModel(internalStorageAdapter: MockStorage());
    model.name = "eu";
    model.surname = "eu";

    model.saveUser();
    // expect(model.saveUser(), completion(isNull));
    model.getFullName().then((value) {
      print(value);
      expect(value, 'eu eu');
    });
  });
}

class MockStorage extends InternalStorageAdapter {
  String? name;
  String? surname;

  @override
  Future<String> getFullName() {
    return Future.value("$name $surname");
  }

  @override
  void saveUser(String name, String surname) {
    this.name = name;
    this.surname = surname;
  }
}
