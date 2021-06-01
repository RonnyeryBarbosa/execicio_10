import 'package:internal_storege/form_model.dart';

class ControllerForm {
  FormModel _model = FormModel();

  String get name => _model.name ?? '';
  String get surname => _model.surname ?? '';
  Future<String> get fullname => _model.getFullName();

  void updateName(String name) {
    _model.name = name;
  }

  void updateSurname(String surname) {
    _model.surname = surname;
  }

  void saveUser() {
    _model.saveUser();
  }
}
