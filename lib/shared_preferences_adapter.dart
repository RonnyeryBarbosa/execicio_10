import 'package:internal_storege/internal_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesAdapter extends InternalStorageAdapter {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void saveUser(String name, String surname) async {
    final internalPref = await _prefs;
    internalPref.setString('name', name);
    internalPref.setString('surname', surname);
    print("Dados Salvos");
  }

  Future<String> getFullName() async {
    final internalPref = await _prefs;
    String? name = internalPref.getString('name');
    String? surname = internalPref.getString('surname');

    if ((name != null) && (surname != null)) {
      return name + ' ' + surname;
    } else {
      return 'Usuário não salvo.';
    }
  }

  @override
  void saveName(String name) async {
    final internalPref = await _prefs;

    internalPref.setString('name_auto', name);
    print("save name");
  }

  @override
  void saveSurname(String surname) async {
    final internalPref = await _prefs;
    internalPref.setString('surname_auto', surname);
  }

  @override
  Future<String> getName() async {
    final internalPref = await _prefs;
    String? name = internalPref.getString('name_auto');

    print("dsad");

    if ((name != null)) {
      return name;
    } else {
      return "";
    }
  }

  @override
  Future<String> getSurname() async {
    final internalPref = await _prefs;
    String? surname = internalPref.getString('surname_auto');

    if ((surname != null)) {
      return surname;
    } else {
      return "";
    }
  }
}
