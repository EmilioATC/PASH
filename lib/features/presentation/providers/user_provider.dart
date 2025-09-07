import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// StateNotifier que maneja el estado del nombre
class NameNotifier extends StateNotifier<String?> {
  NameNotifier() : super(null) {
    _loadName();
  }

  // Cargar el nombre guardado en SharedPreferences
  Future<void> _loadName() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getString('is_name_user');
  }

  // Guardar el nombre
  Future<void> setName(String newName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('is_name_user', newName);
    state = newName;
  }
}

// Provider
final nameProvider = StateNotifierProvider<NameNotifier, String?>((ref) {
  return NameNotifier();
});
