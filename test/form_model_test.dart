import 'package:flutter_test/flutter_test.dart';
import 'package:internal_storege/form_model.dart';
import 'package:internal_storege/internal_storage.dart';

void main() {
  group(
    'Storage',
    () {
      final model = FormModel(internalStorageAdapter: MockStorage());

      test('Name shold auto save', () {
        model.saveName("João");
        model.getName().then((value) {
          expect(value, 'João');
        });
      });

      test('Surname shold auto save', () {
        model.saveSurname("Fernandes");
        model.getSurname().then((value) {
          expect(value, 'Fernandes');
        });
      });

      test('Name and Surname shold auto save', () {
        model.saveUser();
        model.getFullName().then((value) {
          print(value);
          expect(value, 'João Fernandes');
        });
      });
    },
  );
}

//   test('check if the user has been saved', () {
//     model.name = "eu";
//     model.surname = "eu";

//     model.saveUser();
//     // expect(model.saveUser(), completion(isNull));
//     model.getFullName().then((value) {
//       print(value);
//       expect(value, 'eu eu');
//     });
//   });
// }

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

  @override
  void saveName(String name) {
    this.name = name;
  }

  @override
  void saveSurname(String surname) {
    this.surname = surname;
  }

  @override
  Future<String> getName() {
    return Future.value("$name");
  }

  @override
  Future<String> getSurname() {
    return Future.value("$surname");
  }
}
