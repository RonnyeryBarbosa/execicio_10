import 'package:internal_storege/form_model.dart';

class ControllerForm {
  FormModel _model = FormModel();

  Future<String> get fullname => _model.getFullName();
  Future<String> get name => _model.getName();
  Future<String> get surname => _model.getSurname();

  void updateName(String name) {
    _model.saveName(name);
  }

  void updateSurname(String surname) {
    _model.saveSurname(surname);
  }

  void saveUser() {
    _model.saveUser();
  }
}
